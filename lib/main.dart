import 'package:authentication_repository/authentication_repository.dart';
import 'package:e_commerce_application/firebase_options.dart';
import 'package:e_commerce_application/app/view/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized(); // this is used to wait for the flutter to initialzed the flutter engine
   await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform); // this is used to initialize the firebase app
     final authenticationRepository = AuthenticationRepository(); // this is used to initialize the authentication repository
  await authenticationRepository.user.first;
  runApp(App(authenticationRepository: authenticationRepository));
  }
 