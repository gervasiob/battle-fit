import 'dart:math';

import 'package:battlefit/src/features/rpg_engine/domain/services/rpg_engine.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HealthSyncService {
  final SupabaseClient _client = Supabase.instance.client;
  final RpgEngine _rpgEngine = RpgEngine();

  /// Fetches health data from a mock source.
  ///
  /// In a real application, this method would connect to Google Fit or Apple Health.
  Future<Map<String, int>> getMockHealthData() async {
    final random = Random();
    return {
      'steps': random.nextInt(10000),
      'calories': random.nextInt(500),
      'activeMinutes': random.nextInt(60),
    };
  }

  /// Saves the daily activity to the Supabase database.
  Future<void> saveDailyActivity(String userId) async {
    try {
      final healthData = await getMockHealthData();
      final expGained = _rpgEngine.calculateExpGained(
        steps: healthData['steps']!,
        calories: healthData['calories']!,
        activeMinutes: healthData['activeMinutes']!,
      );

      await _client.from('daily_activity').insert({
        'user_id': userId,
        'date': DateTime.now().toIso8601String(),
        'steps': healthData['steps'],
        'calories': healthData['calories'],
        'active_minutes': healthData['activeMinutes'],
        'exp_gained': expGained,
      });
    } catch (e) {
      rethrow;
    }
  }
}
