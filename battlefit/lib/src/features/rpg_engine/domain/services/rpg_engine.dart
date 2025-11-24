
import 'dart:math';

class RpgEngine {
  // Constants for balancing the game
  static const double _expFactor = 0.1;
  static const int _baseExpForLevelUp = 100;
  static const double _levelUpMultiplier = 1.5;
  static const int _skillPointsPerLevel = 2;

  /// Calculates the experience points (EXP) gained from a physical activity.
  ///
  /// The formula can be adjusted to balance the game.
  int calculateExpGained({
    int steps = 0,
    int calories = 0,
    int activeMinutes = 0,
  }) {
    return ((steps + (calories * 2) + (activeMinutes * 3)) * _expFactor).toInt();
  }

  /// Determines if a user has leveled up based on their current EXP.
  bool hasLeveledUp(int currentExp, int currentLevel) {
    return currentExp >= getExpForNextLevel(currentLevel);
  }

  /// Calculates the EXP required to reach the next level.
  ///
  /// The formula is scalable, meaning that each level requires more EXP than the last.
  int getExpForNextLevel(int currentLevel) {
    return (_baseExpForLevelUp * pow(_levelUpMultiplier, currentLevel - 1)).toInt();
  }

  /// Returns the number of skill points awarded for leveling up.
  int getSkillPointsForLevelUp() {
    return _skillPointsPerLevel;
  }
}
