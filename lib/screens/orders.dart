import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(35, 12, 2, 1),
      body: Center(
        child: Text(
          "all orders",
          style: TextStyle(
            color: Color.fromRGBO(238, 220, 198, 1),
          ),
        ),
      ),
    );
  }
}
