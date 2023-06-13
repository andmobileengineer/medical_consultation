import 'package:equatable/equatable.dart';
import 'package:medical_consultation_app/domain/api/network_bound_resource.dart';

class NetworkBoundState extends Equatable {
  const NetworkBoundState();
  @override
  List<Object?> get props => [];
}

class NetworkBoundResourceState<T> extends NetworkBoundState {
  final Resource<T> resource;
  const NetworkBoundResourceState(this.resource) : super();

  factory NetworkBoundResourceState.initial() {
    return NetworkBoundResourceState(Resource.initial());
  }

  factory NetworkBoundResourceState.loading({T? data, String? message}) {
    return NetworkBoundResourceState(
        Resource.loading(data: data, message: message));
  }

  factory NetworkBoundResourceState.failed({
    T? data,
    String? message,
    int statusCode = 404,
  }) {
    return NetworkBoundResourceState(
        Resource.failed(data: data, message: message, statusCode: statusCode));
  }

  factory NetworkBoundResourceState.success({T? data, String? message}) {
    return NetworkBoundResourceState(
        Resource.success(data: data, message: message));
  }

  @override
  List<Object?> get props => [resource];
}
