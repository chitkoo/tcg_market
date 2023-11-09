import 'package:bloc/bloc.dart';
import 'package:cards_list_repository/cards_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:tcg_market/app_observer.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  runApp(
    App(
      cardsListReporitory: CardsListReporitory(),
    ),
  );
}
