import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for daily activity
    final dailyActivity = {
      'steps': 5234,
      'calories': 250,
      'activeMinutes': 45,
      'distance': 3.5,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildActivityGrid(dailyActivity),
        ],
      ),
    );
  }

  Widget _buildActivityGrid(Map<String, dynamic> dailyActivity) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildActivityCard('Steps', dailyActivity['steps'].toString()),
        _buildActivityCard('Calories', dailyActivity['calories'].toString()),
        _buildActivityCard('Active Minutes', dailyActivity['activeMinutes'].toString()),
        _buildActivityCard('Distance (km)', dailyActivity['distance'].toString()),
      ],
    );
  }

  Widget _buildActivityCard(String title, String value) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
