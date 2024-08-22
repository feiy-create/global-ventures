// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/Authentication/register.dart';
import 'package:global_luxury_escapes/pages/about_us.dart';
import 'package:global_luxury_escapes/pages/contact_us.dart';
import 'package:global_luxury_escapes/pages/home.dart';
import 'package:global_luxury_escapes/pages/promos.dart';
import 'package:global_luxury_escapes/pages/trips.dart';
import 'package:global_luxury_escapes/pages/wallet.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:ListView(
          children: [
              
     /* Image.asset ("assets/images/pic20.jpg"),
              DrawerHeader(decoration: BoxDecoration(color: const Color.fromARGB(255, 226, 226, 224)),child:
               Text("Profile"),) ,*/
            
     ListTile(title: Text("Home"),tileColor: Colors.blue,
     trailing: Icon(Icons.abc_sharp), 
          onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Home(),
    ),
  );
     },    
     ),
 ListTile(title: Text("Trips"),tileColor: Colors.blue,
    //trailing-- Icons at the end
    //leading --Icons at the start
     leading: Icon(Icons.card_travel_rounded),     
      onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Trips(),
    ),
  );
     },
      ),
         ListTile(title: Text("Wallet"),tileColor:  Colors.blue,
     leading: Icon(Icons.ac_unit_rounded),
          onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Wallet(),
    ),
  );
     }, ),
     ListTile(title: Text("Promos"),tileColor:  Colors.blue,
     leading: Icon(Icons.ac_unit_rounded), 
          onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Promos(),
    ),
  );
     },
     ),   ListTile(title: Text("AboutUs"),tileColor: Colors.blue,
     leading: Icon(Icons.people_outline_rounded), 
          onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const AboutUs(),
    ),
  );
     },
     ), 
       ListTile(title: Text("ContactUs"),tileColor: Colors.blue,
     leading: Icon(Icons.add_ic_call),
          onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ContactUs(),
    ),
  );
     }, ),
     
       ListTile(title: Text("Logout"),tileColor: Colors.blue,
     leading: Icon(Icons.ac_unit_rounded), 
          onTap: (){
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Register(),
    ),
  );
     },
     ),
         ]
        )
      ),
     /* bottomNavigationBar:BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc),)
      ],) ,*/

        appBar: AppBar(
         title: Text("Homepage"),
        centerTitle: true,
         backgroundColor: Color.fromARGB(26, 22, 1, 78),          
      ),
      body: ListView(
        children: const [
    Card.filled(
      child: Image (image:AssetImage("assets/images/pic1.jpg")),
    ),
  
Card.filled(
   child: Image (image:AssetImage("assets/images/pic2.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic4.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic5.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic6.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic7.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic8.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic9.jpg")),
),
Card.filled(
   child: Image (image:AssetImage("assets/images/pic10.jpg")),
),
      ],),  
    );
  }
}