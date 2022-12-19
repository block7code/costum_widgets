import 'package:flutter/material.dart';

import 'custom_button_example.dart';
import 'custom_check_page.dart';
import 'custom_text_example.dart';
import 'example_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomCheckPage(),
     // home: ExamplePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
