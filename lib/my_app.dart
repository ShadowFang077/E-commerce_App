import 'package:e_commerce_application/screens/home_screen.dart';

import 'package:e_commerce_application/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> check() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  // await  Future.delayed(Duration(seconds: 5));
  // assert(false);
    return preferences.getBool('loggedin') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: check(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while waiting for the check
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Navigate based on the result of the check
            return snapshot.data == true
                ? HomeScreen()
                : const SplashScreen();
          }
        },
      ),
    );
  }
}
