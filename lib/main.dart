import 'package:flutter/material.dart';
import 'package:surplus/screens/auth_screen/signin.dart';
import 'package:surplus/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(241, 90, 41, 1),
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(241, 90, 41, 1),
        ),

        //primarySwatch: Color.fromRGBO(241, 90, 41, 1),
      ),
      home: const HomeScreen(),
    );
  }
}
