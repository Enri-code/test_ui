import 'package:flutter/material.dart';
import 'package:test_ui/features/home/presentation/screens/home.dart';
import 'package:test_ui/global/presentation/theme/theme_data.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test UI',
      theme: ThemeSettings.theme,
      routes: ThemeSettings.routes,
      initialRoute: HomeScreen.route,
    );
  }
}

