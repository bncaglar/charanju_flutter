import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigation_system_state.dart';

class NavigationSystemCubit extends Cubit<NavigationSystemState> {
  NavigationSystemCubit() : super(HomeScreenState());

  void changeScreen({required NavigationSystemState navigationSystemState}) {
    emit(navigationSystemState);
  }

  NavigationSystemState getTheCurrentScreen() {
    return state;
  }
}
