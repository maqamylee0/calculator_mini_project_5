import 'dart:developer';

import 'package:calculator_mini_project_5/providers/calc_provider.dart';
import 'package:calculator_mini_project_5/screens/calculator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalcProvider()),
      ],
      child: DevicePreview(
        builder: (context) =>const MyApp(),
      ),
    ),

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}
