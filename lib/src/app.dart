import 'package:flutter/material.dart';
import 'package:flutter_material_search/src/screens/homeScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Material Search',
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new HomeScreen(),
      ),
    );
  }
}
