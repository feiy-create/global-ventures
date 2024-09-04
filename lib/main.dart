import 'package:flutter/material.dart';
import 'package:global_luxury_escapes/Authentication/splash_screen.dart';
import 'package:global_luxury_escapes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

void main() async {
  //initializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//class houses everything
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  //build method below builds the UI
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // to remove the debug tag
      title: ' GLOBAL LUXURY ESCAPES',
      theme: ThemeData(
      scaffoldBackgroundColor:  Colors.blueAccent,
      ),
      home: const SplashScreen(),
    );
  }
}
