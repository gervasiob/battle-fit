import 'package:battlefit/src/core/utils/logging_interceptor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnboardingRepository {
  final SupabaseClient _client = Supabase.instance.client;
  final LoggingInterceptor _logger = LoggingInterceptor();

  Future<void> saveUserProfile({
    required String userId,
    required String username,
    required int age,
    required double weight,
    required int height,
  }) async {
    _logger.logRequest('saveUserProfile', params: {
      'userId': userId,
      'username': username,
      'age': age,
      'weight': weight,
      'height': height
    });
    try {
      await _client.from('users_profile').upsert({
        'user_id': userId,
        'username': username,
        'age': age,
        'weight': weight,
        'height': height,
      });
      _logger.logResponse('saveUserProfile');
    } catch (e) {
      _logger.logError('saveUserProfile', error: e);
      rethrow;
    }
  }
}
