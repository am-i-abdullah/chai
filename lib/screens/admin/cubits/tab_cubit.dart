import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events
enum TabEvent { tab1Selected, tab2Selected }

class TabCubit extends Cubit<int> {
  TabCubit() : super(0); // Default index is 0

  void selectTab(int index) {
    emit(index);
  }
}