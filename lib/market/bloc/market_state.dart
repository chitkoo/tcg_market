part of 'market_bloc.dart';

enum ApiStatus { pure, loading, succeeded, failed }

class MarketState extends Equatable {
  const MarketState({
    this.cardsList = const [],
    this.status = ApiStatus.pure,
  });

  final List<CardData> cardsList;
  final ApiStatus status;

  @override
  List<Object> get props => [cardsList, status];

  MarketState copyWith({
    List<CardData>? cardsList,
    ApiStatus? status,
  }) {
    return MarketState(
      cardsList: cardsList ?? this.cardsList,
      status: status ?? this.status,
    );
  }
}
