// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookAFlight extends StatefulWidget {
  const BookAFlight({super.key});

  @override
  State<BookAFlight> createState() => _BookAFlightState();
}

class _BookAFlightState extends State<BookAFlight> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  
  String _tripType = 'One Way'; // Default trip type

  Future<void> _bookFlight() async {
    final name = _nameController.text;
    final from = _fromController.text;
    final to = _toController.text;
    final date = _dateController.text;
    final isOneWay = _tripType == 'One Way';
    final isRoundTrip = _tripType == 'Round Trip';

    if (from.isEmpty || to.isEmpty || date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    final bookingData = {
      'name': name,
      'from': from,
      'to': to,
      'date': date,
      'isOneWay': isOneWay,
      'isRoundTrip': isRoundTrip,
    };

    try {
      await FirebaseFirestore.instance.collection('bookings').add(bookingData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Flight booked successfully!',
        style: TextStyle(color:Colors.green,
        fontSize: 20,),
        ),
        ),
      );
      // Clear the input fields after successful booking
      _nameController.clear();
      _fromController.clear();
      _toController.clear();
      _dateController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error booking flight: $e',
          style: const TextStyle(color:Colors.red,
        fontSize: 20,),
        ),
         ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: Image.asset('assets/images/pic14.jpg'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Book Your Flight",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('One Way'),
                  leading: Radio<String>(
                    value: 'One Way',
                    groupValue: _tripType,
                    onChanged: (value) {
                      setState(() {
                        _tripType = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Round Trip'),
                  leading: Radio<String>(
                    value: 'Round Trip',
                    groupValue: _tripType,
                    onChanged: (value) {
                      setState(() {
                        _tripType = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name"),
                const SizedBox(height: 10),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white38,
                    filled: true,
                  ),
                ),
                const Text("From"),
                const SizedBox(height: 10),
                TextField(
                  controller: _fromController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white38,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 15),
                const Text("To"),
                const SizedBox(height: 10),
                TextField(
                  controller: _toController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white38,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 15),
                const Text("Date"),
                const SizedBox(height: 10),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white38,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    onPressed: _bookFlight,
                    child: const Text(
                      "Book Your Flight",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
