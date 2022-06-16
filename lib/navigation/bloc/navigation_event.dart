part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationStatusChanged extends NavigationEvent {
  const NavigationStatusChanged(this.status);

  final NavigationStatus status;

  @override
  List<Object> get props => [status];
}
