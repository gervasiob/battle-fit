import 'package:flutter/material.dart';
import 'package.go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for user profile
    final userProfile = {
      'username': 'PlayerOne',
      'level': 5,
      'exp': 450,
      'expForNextLevel': 600,
      'strength': 12,
      'stamina': 15,
      'speed': 10,
      'energy': 85,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(userProfile['username'].toString()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go('/home/profile/settings');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAvatarSection(),
          const SizedBox(height: 24),
          _buildStatsSection(userProfile),
        ],
      ),
    );
  }

  Widget _buildAvatarSection() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          // TODO: Replace with user's avatar
          child: Icon(Icons.person, size: 50),
        ),
        SizedBox(height: 8),
        Text(
          'Level 5',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildStatsSection(Map<String, dynamic> userProfile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stats',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildStatTile('Strength', userProfile['strength']),
        _buildStatTile('Stamina', userProfile['stamina']),
        _buildStatTile('Speed', userProfile['speed']),
        _buildStatTile('Energy', userProfile['energy']),
      ],
    );
  }

  Widget _buildStatTile(String title, dynamic value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
