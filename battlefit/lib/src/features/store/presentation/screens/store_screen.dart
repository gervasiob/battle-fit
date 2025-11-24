import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for store items
    final List<Map<String, dynamic>> storeItems = [
      {'name': 'Green Avatar Skin', 'price': 500, 'type': 'Skin'},
      {'name': 'Gold Avatar Border', 'price': 1000, 'type': 'Cosmetic'},
      {'name': 'Energy Potion', 'price': 100, 'type': 'Consumable'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Chip(
              label: Text('Coins: 2500'), // TODO: Replace with user's coins
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: storeItems.length,
        itemBuilder: (context, index) {
          final item = storeItems[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    // TODO: Replace with item image
                    child: const Icon(Icons.shopping_bag, size: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text('Price: ${item['price']} coins'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
