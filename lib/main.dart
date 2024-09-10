import 'package:flutter/material.dart';
import 'package:login_ui_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 73, 148, 234)),
        useMaterial3: true,
      ),
      home: LoginPage()
    );
  }
}

