import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  final String destination;
  final String price;

  // Constructor with parameters for destination and price
  const Wallet({
    super.key,
    required this.destination,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Wallet",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0, // Optional: to remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the selected flight information
            Text(
              "Destination: $destination",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: $price",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Example placeholder for payment integration
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder action for payment process
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Proceeding with payment for $destination"),
                    ),
                  );
                },
                child: const Text('Proceed to Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
