import 'package:bloc/bloc.dart';
import 'package:cards_list_repository/cards_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc({
    required CardsListReporitory cardsListReporitory,
  })  : _cardsListReporitory = cardsListReporitory,
        super(const MarketState()) {
    on<GetCardsList>(_onGetCardsList);
  }

  final CardsListReporitory _cardsListReporitory;

  Future<void> _onGetCardsList(
    GetCardsList event,
    Emitter<MarketState> emit,
  ) async {
    final response = await _cardsListReporitory.getCardsList();

    debugPrint('Response ${response.data?.length}');
  }
}
