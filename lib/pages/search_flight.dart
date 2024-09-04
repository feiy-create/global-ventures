import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/pages/book_a_flight.dart';

class SearchFlight extends StatefulWidget {
  const SearchFlight({super.key});

  @override
  State<SearchFlight> createState() => _SearchFlightState();
}

class _SearchFlightState extends State<SearchFlight> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
      child: Expanded(
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
                    const SizedBox(
                      height: 15,
                    ),
               
                  ],
                ),
                const Icon(
                  Icons.notification_add_rounded,
                  color: Colors.white38,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
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
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: "Search a flight",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 54, 53, 53),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Upcoming Trips",
              style: TextStyle(
                color: Color.fromARGB(255, 17, 3, 2),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "20 september,6:30pm",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                      ),
                      Text(
                        "10 november,12:30pm",
                        style: TextStyle(
                           fontSize: 15,
                           color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height:20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SNP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("..."),
                      Icon(Icons.flight_outlined),
                      Text("..."),
                      Text(
                        "MLY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Singapore",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                       const SizedBox(
                    height: 20,
                  ),
                      Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Malaysia",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Destinations",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      popularDestinations('assets/images/pic10.jpg', 'Paris', 'France'),
                      popularDestinations('assets/images/pic16.jpg', 'Rome', 'Italy'),
                      popularDestinations('assets/images/pic12.jpg', 'Istanbul', 'Turkey'),
                    ],
                  ),  const SizedBox(
                    height: 50,
                  ),
             ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookAFlight()),
                          );
                        },
                        child: const Text('Book Flight Now',
                        style: TextStyle(
                          backgroundColor: Colors.black38,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                        
                        
                      ),
                ],
              ),
            ),
          ],
        

        ),
      )
      ),
    );
  }

  Widget popularDestinations(String img, String city, String country) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 4, 8, 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 200,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 150,
            width: 80,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            city,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            country,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
