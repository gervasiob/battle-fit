import 'package:battlefit/src/core/utils/logging_interceptor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _client = Supabase.instance.client;
  final LoggingInterceptor _logger = LoggingInterceptor();

  Future<void> signInWithPassword(String email, String password) async {
    _logger.logRequest('signInWithPassword', params: {'email': email});
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      _logger.logResponse('signInWithPassword', data: response);
    } catch (e) {
      _logger.logError('signInWithPassword', error: e);
      rethrow;
    }
  }

  Future<void> signUp(String email, String password, {String? username}) async {
    _logger.logRequest('signUp', params: {'email': email, 'username': username});
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
        },
      );
      _logger.logResponse('signUp', data: response);
    } catch (e) {
      _logger.logError('signUp', error: e);
      rethrow;
    }
  }

  Future<void> signOut() async {
    _logger.logRequest('signOut');
    try {
      await _client.auth.signOut();
      _logger.logResponse('signOut');
    } catch (e) {
      _logger.logError('signOut', error: e);
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    _logger.logRequest('sendPasswordResetEmail', params: {'email': email});
    try {
      await _client.auth.resetPasswordForEmail(email);
      _logger.logResponse('sendPasswordResetEmail');
    } catch (e) {
      _logger.logError('sendPasswordResetEmail', error: e);
      rethrow;
    }
  }

  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}
