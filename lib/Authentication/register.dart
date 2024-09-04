//reg  is a statefull widget --- type stfl to get the syntax
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/Authentication/log_in.dart';



class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =TextEditingController();
      
  bool hideTextPassword = true;
  bool hideText = true;
  //an asychronous future method
  //logic taking care of every scenario a user can enter
  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("passwords do not match"),
        backgroundColor: Color.fromARGB(255, 248, 2, 2),
      ));
      return;
    }
    try {
      //if every detail is correct usercredential holds all details of the users
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      //here i'm trying to add extra details of the user
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': emailController.text,
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LogIn(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Registration succesful"),
        backgroundColor: Color.fromARGB(255, 4, 241, 36),
      ));
    } catch (e) {
  String errorMessage;

  if (e is FirebaseAuthException) {
    switch (e.code) {
      case 'email-already-in-use':
        errorMessage = 'The email address is already in use by another account.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      case 'weak-password':
        errorMessage = 'The password provided is too weak.';
        break;
      default:
        errorMessage = 'An unknown error occurred.';
    }
  } else {
    errorMessage = 'An error occurred: ${e.toString()}';
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(errorMessage),
    backgroundColor: Color.fromARGB(255, 250, 2, 2),
  ));


      // error handling
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error:${e.toString()}'),
        backgroundColor: Color.fromARGB(255, 250, 2, 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Register"),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            //avator/icon
            /* const CircleAvatar(
              backgroundColor:Color.fromARGB(255, 146, 91, 109)
            ) ,*/

            SizedBox(
              height: 15,
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            fillColor: Colors.white,
            filled: true,
                prefixIcon: Icon(Icons.people_alt_outlined),
                labelText: "First name",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            fillColor: Colors.white,
            filled: true,
                prefixIcon: Icon(Icons.people_alt_rounded),
                labelText: "Last name",
              ),
            ),

            SizedBox(
              height: 15,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
           fillColor: Colors.white,
            filled: true,
                prefixIcon: Icon(Icons.email_rounded),
                labelText: "Email",
              ),
            ),

            SizedBox(
              height: 15,
            ),
            TextField(
              controller: passwordController,
              obscureText: hideTextPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            fillColor: Colors.white,
            filled: true,
                prefixIcon: Icon(Icons.password),
                   suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideTextPassword = !hideTextPassword;
                    });
                  },
                  icon:
                      Icon(hideTextPassword ? Icons.visibility_off : Icons.visibility),
                ),
                labelText: "Password",
              ),
            ),

            SizedBox(
              height: 15,
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: hideText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            fillColor: Colors.white,
            filled: true,
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideText = !hideText;
                    });
                  },
                  icon:
                      Icon(hideText ? Icons.visibility_off : Icons.visibility),
                ),
                labelText: "Confirm Password",
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ElevatedButton(
  onPressed: () {
    registerUser(); // Calling the register method I declared above
  },
  child: const Text("Register"),
),
  SizedBox(
              height: 20,
            ),
   RichText(
              text: TextSpan(
                text: "You already have an account?",
                style: const TextStyle(color: Colors.black,
                fontSize: 15,),
                children: <TextSpan>[
                  TextSpan(
                    text: ' LogIn',
                    style: TextStyle(
                      color: Color.fromARGB(255, 62, 241, 8),
                      fontWeight:FontWeight.bold,
                    fontSize: 20,),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
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
