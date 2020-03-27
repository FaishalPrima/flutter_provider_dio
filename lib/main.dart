import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/corona_provider.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CoronaProvider())],
      child: MaterialApp(
        home: Home(),
        title: 'Corona Tracker',
      ),
    );
  }
}
