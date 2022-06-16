import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

enum NavigationStatus { start, registering, login }

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.start()) {
    on<NavigationStatusChanged>(_onAuthenticationStatusChanged);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    NavigationStatusChanged event,
    Emitter<NavigationState> emit,
  ) async {
    switch (event.status) {
      case NavigationStatus.start:
        return emit(const NavigationState.start());
      case NavigationStatus.login:
        return emit(const NavigationState.login());
      case NavigationStatus.registering:
        return emit(const NavigationState.registering());
    }
  }
}
