import 'package:dio/dio.dart';
import 'package:medical_consultation_app/domain/api/mock_data.dart';
import 'package:medical_consultation_app/domain/api/response_codes.dart';

class MockResponseInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    dynamic data;
    int statusCode = ResponseCode.success;

    try {
      data = await MockData.instance.getMockData(options);
    } catch (e) {
      statusCode = ResponseCode.notImplemented;
      data = e.toString();
    }

    await Future.delayed(const Duration(seconds: 2));
    if (statusCode == ResponseCode.success) {
      handler.resolve(
        Response(requestOptions: options, data: data, statusCode: statusCode),
      );
    } else {
      handler.reject(
        DioError(
          requestOptions: options,
          response: Response(
            requestOptions: options,
            data: data,
            statusCode: statusCode,
          ),
          error: data,
        ),
      );
    }
  }
}
