import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_creator/screens/icon_creator_screen.dart';

import 'bloc/icon_creator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.amber, brightness: Brightness.light),
      ),
      dark: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
              .copyWith(secondary: Colors.amber, brightness: Brightness.dark)),
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: 'Icon Creator',
          theme: theme,
          darkTheme: darkTheme,
          home: const MyHomePage(title: 'Icon Creator'),
        );
      },
      initial: AdaptiveThemeMode.system,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IconCreatorBloc(),
      child: const IconCreatorScreen(),
    );
  }
}