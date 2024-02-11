import 'package:chai/screens/booking.dart';
import 'package:chai/screens/orders.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenIndex = 0;

  final _screens = [
    const BookingScreen(),
    const OrdersScreen(),
  ];

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
      body: _screens[_screenIndex],
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(46, 39, 47, 1),
        padding: const EdgeInsets.all(10),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showUnselectedLabels: true,
          currentIndex: _screenIndex,
          onTap: (index) {
            setState(() {
              _screenIndex = index;
            });
          },

          elevation: 0,
          // items style
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromRGBO(130, 125, 136, 1),

          // labels styling
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: 'Place Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Orders',
            ),
          ],
        ),
      ),
    );
  }
}
