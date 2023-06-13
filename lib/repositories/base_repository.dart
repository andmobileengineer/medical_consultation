import 'package:medical_consultation_app/cache/user_session_cache.dart';
import 'package:medical_consultation_app/di/injection.dart';
import 'package:medical_consultation_app/domain/api/api_manager.dart';

abstract class BaseRepository {
  final UserSessionCache userSessionCache = instance<UserSessionCache>();
  final APIManager apiManager = instance();
}
