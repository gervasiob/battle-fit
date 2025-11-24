import 'package:battlefit/src/features/rpg_engine/domain/services/rpg_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RpgEngine', () {
    late RpgEngine rpgEngine;

    setUp(() {
      rpgEngine = RpgEngine();
    });

    test('calculateExpGained returns correct EXP', () {
      final exp = rpgEngine.calculateExpGained(
        steps: 1000,
        calories: 100,
        activeMinutes: 30,
      );
      expect(exp, 129);
    });

    test('hasLeveledUp returns true when EXP is sufficient', () {
      final hasLeveledUp = rpgEngine.hasLeveledUp(150, 1);
      expect(hasLeveledUp, isTrue);
    });

    test('hasLeveledUp returns false when EXP is insufficient', () {
      final hasLeveledUp = rpgEngine.hasLeveledUp(50, 1);
      expect(hasLeveledUp, isFalse);
    });

    test('getExpForNextLevel returns correct EXP for level 1', () {
      final exp = rpgEngine.getExpForNextLevel(1);
      expect(exp, 100);
    });

    test('getExpForNextLevel returns correct EXP for level 2', () {
      final exp = rpgEngine.getExpForNextLevel(2);
      expect(exp, 150);
    });

    test('getSkillPointsForLevelUp returns correct skill points', () {
      final skillPoints = rpgEngine.getSkillPointsForLevelUp();
      expect(skillPoints, 2);
    });
  });
}
