import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_consultation_app/application/home/appointments_cubit.dart';
import 'package:medical_consultation_app/cache/user_session_cache.dart';
import 'package:medical_consultation_app/constants/constants.dart';
import 'package:medical_consultation_app/domain/api/api_manager.dart';
import 'package:medical_consultation_app/domain/api/interceptor/mock_response_interceptor.dart';
import 'package:medical_consultation_app/infrastructure/core/app_config.dart';
import 'package:medical_consultation_app/repositories/appointments/appointment_repository.dart';

final instance = GetIt.I;

Future<void> initAppModule() async {
  instance.registerSingleton<UserSessionCache>(UserSessionCacheImpl());
  _registerAPIManager();
  instance
    ..registerLazySingleton<AppointmentRepository>(
      () => AppointmentRepositoryImpl(),
    )
    ..registerSingleton<AppointmentsCubit>(
        AppointmentsCubit(repository: instance()));
}

void _registerAPIManager() {
  final Dio dio = getHttpClientAfterAddingInterceptors();
  instance.registerLazySingleton<APIManager>(() => APIManager(dio));
  instance.registerSingleton<Dio>(dio);
}

Dio getHttpClientAfterAddingInterceptors() {
  BaseOptions options = BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: kConnectTimeout,
    receiveTimeout: kReadTimeout,
  );
  Dio httpClient = Dio(options);

  // we can add common header here
  // httpClient.interceptors.add(RequestHeaderInterceptor());

  // we can add cookie jar
  // var cookieJar = instance<CookieJar>();
  // httpClient.interceptors.add(CookieManager(cookieJar));

  if (AppConfig.isMockEnvironment) {
    httpClient.interceptors.add(MockResponseInterceptor());
  }
  return httpClient;
}
