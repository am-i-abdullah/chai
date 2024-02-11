import 'dart:developer';

import 'package:chai/screens/admin/models/order.dart';
import 'package:chai/screens/admin/widgets/order_card.dart';
import 'package:flutter/material.dart';

class IncomingOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return OrderCard(
              text: "Accept Order",
              order: orders[index],
              onBlockPressed: () {
               log("Order Accepted, implement Firebase here");
              },
            );
          },
        ),
      ),
    );
  }
}


