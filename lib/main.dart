import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/pages/splash.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          titleSpacing:20.0,
          iconTheme: IconThemeData( color: Colors.black),
          titleTextStyle: TextStyle(
            color:  Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            elevation: 30.0
        ) ,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
      ),
      home:  const LogoScreen(),

    );
  }
}

