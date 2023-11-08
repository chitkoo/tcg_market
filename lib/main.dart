import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tcg_market/app_observer.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  runApp(const App());
}
