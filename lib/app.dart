import 'package:flutter/material.dart';
import 'package:flutter_app/singPage.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignPage()
    );
  }
}