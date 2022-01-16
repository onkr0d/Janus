import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:janusapp/home.dart';

void main() {
  runApp(const JanusApp());
}

class JanusApp extends StatelessWidget {
  const JanusApp({Key? key}) : super(key: key);

  final AdaptiveThemeMode currentTheme = AdaptiveThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.indigo),
        dark: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.indigo),
        initial: currentTheme,
        builder: (theme, darkTheme) => MaterialApp(
              theme: theme,
              darkTheme: darkTheme,
              home: const Home(),
              debugShowCheckedModeBanner: false,
            ));
  }
}
