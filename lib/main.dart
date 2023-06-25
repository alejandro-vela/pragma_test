import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'global_locator.dart';
import 'src/bloc/observer_bloc.dart';
import 'src/ui/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGlobalLocator();
  Bloc.observer = ObserverBloc();
  runApp(const PragmaTest());
}

class PragmaTest extends StatelessWidget {
  const PragmaTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
