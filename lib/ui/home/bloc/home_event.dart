part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeLoad extends HomeEvent {
  const HomeLoad();

  @override
  List<Object> get props => [];
}
