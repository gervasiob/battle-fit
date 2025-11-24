import 'package:flutter/material.dart';

class ChallengeDetailScreen extends StatelessWidget {
  const ChallengeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge Detail'),
      ),
      body: const Center(
        child: Text('Challenge Detail Screen'),
      ),
    );
  }
}
