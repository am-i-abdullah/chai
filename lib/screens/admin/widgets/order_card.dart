import 'package:chai/screens/admin/models/order.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onBlockPressed;
  final String text;

  const OrderCard({
    required this.text,
    required this.order,
    required this.onBlockPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Placer: ${order.orderPlacerName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Order Summary: ${order.orderSummary}'),
            const SizedBox(height: 8.0),
            Text('Order Location: ${order.orderLocation}'),
            const SizedBox(height: 8.0),
            Text('Order Placer\'s Phone: ${order.orderPlacerPhone}'),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: onBlockPressed,
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
