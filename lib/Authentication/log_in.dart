//import 'package:flutter/cupertino.dart';
// ignore_for_file: camel_case_types, prefer_const_constructors

// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/Authentication/forget_password.dart';
import 'package:global_luxury_escapes/Authentication/register.dart';
import 'package:global_luxury_escapes/pages/landing.dart';

class log_in extends StatefulWidget {
  const log_in({super.key});
  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(26, 78, 8, 207),
        centerTitle: true,
        title: const Text("logIn"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            //avator/icon
           /* const CircleAvatar(
              backgroundColor: Color.fromARGB(213, 14, 13, 13) ),*/

            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.email_sharp),
                      labelText: "Email",
                    ),
                  ),
                  
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp),
                      labelText: "Password",
                    ),
                    obscureText:true
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector( //for clickable text
                  onTap:() {
                   //logic for onTap 
                     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ForgetPassword(),
    ),
  );
                  },
                child:const Text("Forget Password",style:TextStyle(backgroundColor:  Color.fromARGB(255, 212, 208, 208) ) ,),
                ),
                 const SizedBox(
              height: 15,
            ),
    
                ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Landing(),
    ),
  );
                  },
                  child: const Text("log_in"),
                ),
              ],
            ),
             const SizedBox(
              height: 20,
            ),
    
RichText(
  text: TextSpan(
    text: 'You already have an account?',
    style: TextStyle(color:Colors.black),
    children:  <TextSpan>[
      TextSpan(text:'Register',
     style: TextStyle(color:Color.fromARGB(255, 84, 7, 228)),
     recognizer: TapGestureRecognizer()
     ..onTap = () {
      //Logic when navigating to register page

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Register(),
    ),
  );
     },
     ),

    ],
  ),
),

          ],
        ),
      ),
    );
  }
}
