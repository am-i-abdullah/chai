import 'package:chai/screens/admin/cubits/tab_cubit.dart';
import 'package:chai/screens/admin/widgets/incoming_orders.dart';
import 'package:chai/screens/admin/widgets/ongoing_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreenAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: HomeScreenAdminContent(),
    );
  }
}

class HomeScreenAdminContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<TabCubit, int>(
        builder: (context, currentIndex) {
          return IndexedStack(
            index: currentIndex,
            children: [
              IncomingOrdersScreen(),
              OngoingOrdersScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<TabCubit, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index) {
              context.read<TabCubit>().selectTab(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.male),
                label: 'Incoming',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.female),
                label: 'Ongoing',
              ),
            ],
          );
        },
      ),
    );
  }
}

