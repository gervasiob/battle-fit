import 'package:battlefit/src/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingRepositoryProvider =
    Provider<OnboardingRepository>((ref) => OnboardingRepository());

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, bool>((ref) {
  return OnboardingController(ref.watch(onboardingRepositoryProvider));
});

class OnboardingController extends StateNotifier<bool> {
  final OnboardingRepository _onboardingRepository;

  OnboardingController(this._onboardingRepository) : super(false);

  Future<void> saveUserProfile({
    required String userId,
    required String username,
    required int age,
    required double weight,
    required int height,
  }) async {
    state = true;
    try {
      await _onboardingRepository.saveUserProfile(
        userId: userId,
        username: username,
        age: age,
        weight: weight,
        height: height,
      );
    } catch (e) {
      rethrow;
    } finally {
      state = false;
    }
  }
}
