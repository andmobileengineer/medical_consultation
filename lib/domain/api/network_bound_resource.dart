import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/domain/api/response_codes.dart';
import 'package:medical_consultation_app/domain/exceptions/api_exceptions.dart';
import 'package:medical_consultation_app/resources/strings.dart';

class NetworkBoundResource<ResultType, RequestType> {
  final ResultType Function(RequestType result) saveCallResult;
  final ResultType? Function() loadFromDb;
  final bool Function(ResultType? data) shouldFetch;
  final Future<RequestType> Function() createCall;
  final void Function()? networkCallFailure;

  NetworkBoundResource({
    required this.saveCallResult,
    required this.loadFromDb,
    required this.shouldFetch,
    required this.createCall,
    this.networkCallFailure,
  });

  Stream<Resource<ResultType>> load() async* {
    yield Resource.loading();
    final ResultType? event = loadFromDb();

    if (!shouldFetch(event)) {
      yield Resource.success(data: event);
    } else {
      try {
        var result = await _fetchFromNetwork(createCall, saveCallResult);
        yield Resource.success(data: result);
      } on AppException catch (e) {
        debugPrint("Fetching failed: ${e.toString()}");
        yield Resource.failed(
            data: null, message: e.message, statusCode: e.code);
      } catch (e) {
        yield Resource.failed(data: null, message: e.toString());
      }
    }
  }

  Future<ResultType> _fetchFromNetwork(
      Future<RequestType> Function() createCall,
      ResultType Function(RequestType result) processResponse) async {
    return await createCall().then((value) async {
      return processResponse(value);
    }).catchError((Object obj) {
      networkCallFailure?.call();
      throw _handleException(obj);
    });
  }

  AppException _handleException(Object object) {
    int statusCode = 0;
    Response<dynamic>? response;
    List<String> errorIgnoreList = ["html", "jboss", "exception"];
    switch (object.runtimeType) {
      case DioError:
        response = (object as DioError).response;
        statusCode = response?.statusCode ?? 0;
        break;
      default:
        break;
    }

    debugPrint("Network Error: ${object.toString()}");
    String errorMessage = response.toString();

    for (String error in errorIgnoreList) {
      if (errorMessage.toLowerCase().contains(error.toLowerCase())) {
        errorMessage = Strings.somethingWentWrong;
      }
    }
    debugPrint('_handleException: ${response.toString()}');

    if (errorMessage.toLowerCase() == "null") {
      errorMessage = Strings.somethingWentWrong;
    }
    AppException exception;
    switch (statusCode) {
      case ResponseCode.badRequest:
        exception = BadRequestException(errorMessage, code: statusCode);
        break;
      case ResponseCode.unauthorized:
      case ResponseCode.forbidden:
        exception = UnauthorizedException(errorMessage, code: statusCode);
        break;
      case ResponseCode.invalidOTP:
        exception = InvalidOTPException(errorMessage, code: statusCode);
        break;
      case ResponseCode.internalServerError:
        exception = UnauthorizedException(errorMessage, code: statusCode);
        break;
      default:
        exception = FetchDataException(
          errorMessage.isNotEmpty
              ? errorMessage
              : Strings.somethingWentWrong,
          code: statusCode,
        );
        break;
    }

    return exception;
  }
}

class Resource<T> {
  final Status status;
  final T? data;
  final String? message;
  final int statusCode;

  const Resource(
      {this.data,
      required this.status,
      this.message,
      required this.statusCode});

  static Resource<T> initial<T>({T? data}) =>
      Resource<T>(data: data, status: Status.initial, statusCode: -1);

  static Resource<T> loading<T>({T? data, String? message}) => Resource<T>(
      data: data, message: message, status: Status.loading, statusCode: -2);

  static Resource<T> failed<T>(
          {T? data, String? message, int statusCode = 404}) =>
      Resource<T>(
          data: data,
          status: Status.failed,
          message: message,
          statusCode: statusCode);

  static Resource<T> success<T>(
          {T? data, String? message, int statusCode = 200}) =>
      Resource<T>(
          data: data,
          message: message,
          status: Status.success,
          statusCode: statusCode);

  bool get isInitial => status == Status.initial;

  bool get isLoading => status == Status.loading;

  bool get isFailed => status == Status.failed;

  bool get isSuccess => status == Status.success;
}

enum Status { initial, loading, success, failed }
