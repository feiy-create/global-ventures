import 'package:flutter/material.dart';

class Promos extends StatefulWidget {
  const Promos({super.key});

  @override
  State<Promos> createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Promos"),
      ),
    );
  }
}
