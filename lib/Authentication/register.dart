//reg  is a statefull widget --- type stfl to get the syntax
// ignore_for_file: prefer_const_constructors

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      final TextEditingController confirmPasswordController = TextEditingController();
      bool hideTextPassword = true;
      bool hideText = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(26, 22, 1, 78),
        centerTitle: true,
        title: Text("Register") ,


      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(

          children: [
            //avator/icon
           /* const CircleAvatar(
              backgroundColor:Color.fromARGB(255, 146, 91, 109)
            ) ,*/

            SizedBox(height:15,),
            TextField(
              obscureText: hideText,
                controller:firstNameController,
              decoration: InputDecoration(border:OutlineInputBorder(),
              prefixIcon:Icon(Icons.people_alt_outlined
              ),
              labelText:"First name",

            ),),
          SizedBox(height:15,),
            TextField(
              controller:lastNameController,
                  decoration: InputDecoration(border:OutlineInputBorder(),
              prefixIcon:Icon(Icons.people_alt_rounded
              ),
              labelText:"Last name",
            ),),

            SizedBox(height:15,),
            TextField(
              controller:emailController,
              decoration: InputDecoration( border:OutlineInputBorder(),
              prefixIcon:Icon(Icons.email_rounded
              ),
              labelText:"Email",),),

               SizedBox(height:15,),
            TextField(
                controller:passwordController,
                   decoration: InputDecoration( border:OutlineInputBorder(),
              prefixIcon:Icon(Icons.password
              ),
              suffixIcon: Icon(Icons.remove_red_eye_sharp),
              labelText:"Password",),),

               SizedBox(height:15,),
            TextField(
                controller:confirmPasswordController,
                   decoration: InputDecoration( border:OutlineInputBorder(),
              prefixIcon:Icon(Icons.password
              ),
              suffixIcon: IconButton(onPressed:(){
                setState(hideText: !hideText;) {

                }
              },
              icon:Icon(hideText? Icons.visibility_off:Icons.visibility),),
              labelText:"Confirm Password",),

               ),
                SizedBox(height:15,),
               ElevatedButton(onPressed: (){}, child:const Text("Register"),),

          ],

        ),
      ),
    );
  }
}
