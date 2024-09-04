import 'package:flutter/material.dart';

class Promos extends StatelessWidget {
  const Promos({super.key});

  @override
  Widget build(BuildContext context) {
  
    final List<String> promotions = [
      '20% off on all round trip flights',
      'free cab services on trips above 5 days',
      '25% off on vacation packages',
      'Special discounts this easter season'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Promotions'),
      ),
      body: ListView.builder(
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(promotions[index]),
            leading: const Icon(Icons.local_offer),
          );
        },
      ),
    );
  }
}
