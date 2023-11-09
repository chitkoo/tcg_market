part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.index = 0,
  });

  final int index;

  @override
  List<Object> get props => [index];

  AppState copyWith({
    int? index,
  }) {
    return AppState(
      index: index ?? this.index,
    );
  }
}
