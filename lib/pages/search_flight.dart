// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/pages/book_a_flight.dart';

class SearchFlight extends StatefulWidget {
  const SearchFlight({super.key});

  @override
  State<SearchFlight> createState() => _SearchFlightState();
}

class _SearchFlightState extends State<SearchFlight> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  Future<void> _searchFlights() async {
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('flights')
          .where('searchKeywords', arrayContains: query)
          .get();

      final results = snapshots.docs.map((doc) => doc.data()).toList();

      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      print('Error searching flights: $e');
      setState(() {
        _searchResults = [];
      });
    }
  }

  Future<void> _bookFlight(Map<String, dynamic> flight) async {
    try {
      await FirebaseFirestore.instance.collection('bookings').add(flight);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BookAFlight(),
        ),
      );
    } catch (e) {
      print('Error booking flight: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/pic14.jpg",
                      height: 70,
                      width: 100,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                const Icon(
                  Icons.notification_add_rounded,
                  color: Colors.white38,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "Where do you desire ",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              " to go?",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  _searchFlights();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: "Search a flight",
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 54, 53, 53),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Upcoming Trips",
              style: TextStyle(
                color: Colors.black12,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            Container(padding: const EdgeInsets.all(25),
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("20/09/2024",
                  style: TextStyle(fontSize: 15,
                  color: Colors.black38,),
                  ),
                      Text("15/10/2024",
                  style: TextStyle(fontSize: 15,
                  color: Colors.black38,),
                  ),
                  ],
                ),
                  SizedBox(height: 20),
                         Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Malaysia",
                  style: TextStyle(fontSize: 25,
                  color: Colors.black38,),
                  ),
                  Text("..."),
                  Icon(Icons.flight_land_outlined),
                  Text("..."),
                      Text("Singapore",
                  style: TextStyle(fontSize: 25,
                  color: Colors.black38,),
                  ),
                  ],
                ), 
                SizedBox(height: 30),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Paris",
                  style: TextStyle(fontSize: 25,
                  color: Colors.black38,),
                  ),
                  Text("..."),
                  Icon(Icons.flight_land_outlined),
                  Text("..."),
                      Text("Greece",
                  style: TextStyle(fontSize: 25,
                  color: Colors.black38,),
                  ),
                  ],
                ),    
              ],
            ),),
            const SizedBox(height: 20),
            // Search Results Section
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final flight = _searchResults[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${flight['departureDate']}, ${flight['departureTime']}",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              flight['from'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.flight_outlined),
                            Text(
                              flight['to'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  flight['fromCity'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  flight['toCity'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _bookFlight(flight);
                          },
                          child: const Text('Book Flight Now'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookAFlight(),
                  ),
                );
              },
              child: const Text('Book Flight Now',
                  style: TextStyle(
                    backgroundColor: Colors.black38,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
