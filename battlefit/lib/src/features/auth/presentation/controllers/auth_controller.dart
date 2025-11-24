import 'package:battlefit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController(ref.watch(authRepositoryProvider));
});

final authStateProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

class AuthController extends StateNotifier<User?> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(_authRepository.getCurrentUser());

  Future<void> signInWithPassword(String email, String password) async {
    try {
      await _authRepository.signInWithPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(String email, String password, {String? username}) async {
    try {
      await _authRepository.signUp(email, password, username: username);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authRepository.sendPasswordResetEmail(email);
    } catch (e) {
      rethrow;
    }
  }
}
