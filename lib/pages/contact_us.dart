import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  
  // List to store messages
  final List<Map<String, String>> _messages = [];

  void _submitForm() {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    // Adding the message to the list and showing the success message
    setState(() {
      _messages.add({
        'name': name,
        'email': email,
        'message': message,
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message sent successfully!')),
    );

    // Clearing the text fields after submission
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(26, 230, 229, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Name",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Email",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Message",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Displaying the list of messages
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${message['name']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Email: ${message['email']}'),
                          const SizedBox(height: 8),
                          Text('Message: ${message['message']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
