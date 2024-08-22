import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:const Color.fromARGB(255, 83, 118, 146),
      appBar: AppBar(
         title: const Text("ContactUs"),),
         body:const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Contact Us",
          style: TextStyle(
            fontFamily: AutofillHints.birthday,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          ),
         Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children:[
                TextField(
                  decoration: InputDecoration(filled: true,
                    hintText:"Name",
                    border: OutlineInputBorder(),
                  ),
            
                ),
                SizedBox(
                  height: 20,
                ),
                   TextField(
                  decoration: InputDecoration(filled: true,
                    hintText:"Email",
                    border: OutlineInputBorder(),
                  ),
            
                ),
                 SizedBox(
                  height: 20,
                ),
                   TextField(
                  decoration: InputDecoration(filled: true,
                    hintText:"Message",
                    border: OutlineInputBorder(),
                  ),
            
                ),
                 SizedBox(
                  height: 20,
                ),
               /* MaterialButton(
                  color:Color.fromARGB(255, 14, 13, 13),
                  onPressed: () {}, 
                child: Text(('SUBMIT',
                style:TextStyle(
                  fontFamily: AutofillHints.birthdayMonth,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(243, 240, 240, 1),

                )) as String),)*/
              ]
            ),
          )


         ],
         )


    );
  }
}