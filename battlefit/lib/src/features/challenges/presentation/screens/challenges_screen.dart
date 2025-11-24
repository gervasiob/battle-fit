import 'package:flutter/material.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for challenges
    final List<Map<String, dynamic>> dailyChallenges = [
      {'title': 'Walk 5,000 steps', 'progress': 0.5, 'reward': '50 EXP'},
      {'title': 'Burn 200 calories', 'progress': 0.8, 'reward': '75 EXP'},
    ];

    final List<Map<String, dynamic>> weeklyChallenges = [
      {'title': 'Complete 3 workouts', 'progress': 0.2, 'reward': '200 EXP'},
      {'title': 'Walk 35,000 steps', 'progress': 0.6, 'reward': '300 EXP'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildChallengeSection('Daily Challenges', dailyChallenges),
          const SizedBox(height: 24),
          _buildChallengeSection('Weekly Challenges', weeklyChallenges),
        ],
      ),
    );
  }

  Widget _buildChallengeSection(
      String title, List<Map<String, dynamic>> challenges) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...challenges.map((challenge) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(challenge['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: challenge['progress'],
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 8),
                  Text('Reward: ${challenge['reward']}'),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
