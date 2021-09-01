import 'package:clubhouse_mock/config/Pallete.dart';
import 'package:clubhouse_mock/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Pallete.background),
        scaffoldBackgroundColor: Pallete.background,
        primaryColor: Colors.white,
        accentColor: Pallete.green,
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
