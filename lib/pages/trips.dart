import 'package:flutter/material.dart';

class Trips extends StatefulWidget {
  const Trips({super.key});

  @override
  State<Trips> createState() => _OrdersState();
}

class _OrdersState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Trips"),
        ),
        body: ListView(
          children: const [
            ListTile(
              leading: Text("Trip1"),
            ),
            ListTile(
              leading: Text("Trip2"),
            ),
            ListTile(
              leading: Text("Trip3"),
            ),
            ListTile(
              leading: Text("Trip4"),
            ),
            ListTile(
              leading: Text("Trip5"),
            ),
            ListTile(
              leading: Text("Trip6"),
            ),
            ListTile(
              leading: Text("Trip7"),
            ),
            ListTile(
              leading: Text("Trip8"),
            ),
            ListTile(
              leading: Text("Trip9"),
            ),
            ListTile(
              leading: Text("Trip10"),
            ),
          ],
        ));
  }
}
