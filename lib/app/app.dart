import 'package:cards_list_repository/cards_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';
import 'view/app_view.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.cardsListReporitory,
  });

  final CardsListReporitory cardsListReporitory;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CardsListReporitory(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(),
        child: const AppView(),
      ),
    );
  }
}
