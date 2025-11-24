import 'package:flutter/material.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Detail'),
      ),
      body: const Center(
        child: Text('Activity Detail Screen'),
      ),
    );
  }
}
