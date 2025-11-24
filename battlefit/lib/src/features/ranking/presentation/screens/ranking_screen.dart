import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for ranking
    final List<Map<String, dynamic>> ranking = [
      {'rank': 1, 'username': 'PlayerOne', 'score': 12500},
      {'rank': 2, 'username': 'PlayerTwo', 'score': 11800},
      {'rank': 3, 'username': 'PlayerThree', 'score': 11200},
      {'rank': 4, 'username': 'You', 'score': 10500},
      {'rank': 5, 'username': 'PlayerFive', 'score': 9800},
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildRankingList(ranking),
            _buildRankingList(ranking), // Using the same mock data for weekly
          ],
        ),
      ),
    );
  }

  Widget _buildRankingList(List<Map<String, dynamic>> ranking) {
    return ListView.builder(
      itemCount: ranking.length,
      itemBuilder: (context, index) {
        final player = ranking[index];
        final isYou = player['username'] == 'You';

        return Card(
          color: isYou ? Colors.green[100] : null,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Text(
              '#${player['rank']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            title: Text(
              player['username'],
              style: TextStyle(fontWeight: isYou ? FontWeight.bold : FontWeight.normal),
            ),
            trailing: Text(
              '${player['score']} EXP',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
