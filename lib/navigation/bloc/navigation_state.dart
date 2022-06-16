part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({
    this.status = NavigationStatus.start,
  });

  const NavigationState.start() : this(status: NavigationStatus.start);

  const NavigationState.login() : this(status: NavigationStatus.login);

  const NavigationState.registering() : this(status: NavigationStatus.registering);

  final NavigationStatus status;

  @override
  List<Object> get props => [status];
}
