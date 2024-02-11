import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffEEDCC6),
          foregroundColor: const Color.fromRGBO(35, 12, 2, 1),
          title: const Text(
            "Good Afternoon, Bae",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: Column(
          children: [
            Image.asset('assets/chai2.png'),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text("log out"),
            ),
          ],
        ));
  }
}
