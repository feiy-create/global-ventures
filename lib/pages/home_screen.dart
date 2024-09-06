// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/Authentication/register.dart';
import 'package:global_luxury_escapes/pages/contact_us.dart';
import 'package:global_luxury_escapes/pages/promos.dart';
import 'package:global_luxury_escapes/pages/search_flight.dart';
import 'package:global_luxury_escapes/pages/trips.dart';
import 'package:global_luxury_escapes/pages/wallet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController destinationController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Future<void> placeOrder() async {
    try {
      await FirebaseFirestore.instance.collection('orders').add({
        'destination': destinationController.text,
        'amount': priceController.text,
        'user_id': user!.uid,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order placed successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error placing order: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.lightBlue,
      
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
              const SizedBox(
              height: 35,
            ),
            ListTile(
              title: const Text("Trips",
               style: Textstyle.fontsize:20,),
              tileColor: Colors.lightBlue,
            
              leading: const Icon(Icons.card_travel_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Trips(from: 'required', 
                    to: 'required',
                     date: 'required',
                      isOneWay: true, 
                      isRoundTrip: false,),
                  ),
                );
              },
            ),
              const SizedBox(
              height: 35,
            ), 
                ListTile(
              title: const Text("Search Flight",
               style: Textstyle.fontsize:20,),
              tileColor: Colors.lightBlue, 
              leading: const Icon(Icons.wallet_giftcard),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SearchFlight(),
                  ),
                );
              },
            ),    const SizedBox(
              height: 35,
            ),
            ListTile(
              title: const Text("Wallet",
               style: Textstyle.fontsize:20,),
              tileColor: Colors.lightBlue,
            
              leading: const Icon(Icons.wallet_giftcard),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Wallet(destination: 'required', price: 'required',),
                  ),
                );
              },
            ),
                const SizedBox(
              height: 35,
            ),
                const SizedBox(
              height: 35,
            ),
            ListTile(
              title: const Text("Promos",
               style: Textstyle.fontsize:20,),
              tileColor: Colors.lightBlue,
            
              leading: const Icon(Icons.local_offer),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Promos(),
                  ),
                );
              },
            ),
                const SizedBox(
              height: 35,
            ),
            ListTile(
              title: const Text("Contact Us",
               style: Textstyle.fontsize:20,),
              tileColor: Colors.lightBlue,
            
              leading: const Icon(Icons.contact_phone),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ContactUs(),
                  ),
                );
              },
            ),
                const SizedBox(
              height: 35,
            ),
            ListTile(
              title: const Text("Logout",
              style: Textstyle.fontsize:20,),
              tileColor: Colors.lightBlue,
            
              leading: const Icon(Icons.logout),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:500,
                width:400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/pic10.jpg',
                    height: 400,
                    width: 350,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Let's Explore The",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "World's Best Together",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Search your desired destination",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
