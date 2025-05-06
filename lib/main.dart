import 'package:authentication_repository/authentication_repository.dart';
import 'package:e_commerce_application/firebase_options.dart';
import 'package:e_commerce_application/app/view/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/wishlist_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: App(authenticationRepository: authenticationRepository),
    ),
  );
}



