import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Wallet"),
      ),
      body: 
         const Text(
                        "Welcome  to your wallet page",
                        style: TextStyle(
                           fontSize: 20,
                           color: Colors.black38),
                      ),
                      // I'll intergrate with mpesa
    );
  }
}
