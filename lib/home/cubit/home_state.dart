part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.tab = 0});

  final int tab;

  @override
  List<Object> get props => [tab];
}
