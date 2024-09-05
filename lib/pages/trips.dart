import 'package:flutter/material.dart';
import 'wallet.dart';

class Trips extends StatefulWidget {
  final String from;
  final String to;
  final String date;
  final bool isOneWay;
  final bool isRoundTrip;

  const Trips({
    super.key,
    required this.from,
    required this.to,
    required this.date,
    required this.isOneWay,
    required this.isRoundTrip,
  });

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  void _onImageTap(String imageName) {
    print('Tapped on $imageName');
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'image': 'assets/images/pic22.jpg',
        'destination': 'London, UK',
        'price': '\$4000'
      },
      {
        'image': 'assets/images/pic12.jpg',
        'destination': 'Nairobi, Kenya',
        'price': '\$1500'
      },
      {
        'image': 'assets/images/pic14.jpg',
        'destination': 'Tokyo, Japan',
        'price': '\$2000'
      },
      {
        'image': 'assets/images/pic23.jpg',
        'destination': 'Athens, Greece',
        'price': '\$2700'
      },
      {
        'image': 'assets/images/pic16.jpg',
        'destination': 'Lisbon, Portugal',
        'price': '\$2300'
      },
      {
        'image': 'assets/images/pic17.jpg',
        'destination': 'Bangkok, Thailand',
        'price': '\$3500'
      },
      {
        'image': 'assets/images/pic18.jpg',
        'destination': 'Madrid, Spain',
        'price': '\$3400'
      },
      {
        'image': 'assets/images/pic19.jpg',
        'destination': 'Cape Town, South Africa',
        'price': '\$2450'
      },
      {
        'image': 'assets/images/pic20.jpg',
        'destination': 'Geneva, Switzerland',
        'price': '\$2500'
      },
    ];

    // Filter items based on the trip type and other parameters
    final filteredItems = items.where((item) {
      final destination = item['destination'] ?? '';
      return destination.contains(widget.to); //  filtering based on from,to and date
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Trips"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(26, 230, 229, 233),
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          final image = item['image'] ?? 'assets/images/pic26.jpg'; 
          final destination = item['destination'] ?? 'Destination not found';
          final price = item['price'] ?? 'Price not found';
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _onImageTap(image),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    destination,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Wallet(
                                  destination: destination,
                                  price: price,
                                )),
                          );
                        },
                        child: const Text('Buy Ticket'),
                      ),
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
