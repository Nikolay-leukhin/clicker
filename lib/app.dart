import 'package:clicker/view/pages/home/homepage.dart';
import 'package:clicker/view/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: HomePage(),
    );
  }
}
