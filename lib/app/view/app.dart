import 'package:authentication_repository/authentication_repository.dart';
import 'package:e_commerce_application/app/bloc/app_bloc.dart';
import 'package:e_commerce_application/app/routes/routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        )..add(const AppUserSubscriptionRequested()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 113, 243, 230),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0097A7),
    secondary: Color(0xFF009688),
    surface: Color(0xFFE0F2F1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}


// import 'package:e_commerce_application/screens/home_screen.dart';

// import 'package:e_commerce_application/screens/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<bool> check() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//   // await  Future.delayed(Duration(seconds: 5));
//   // assert(false);
//     return preferences.getBool('loggedin') ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: true,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
//         useMaterial3: true,
//       ),
//       home: FutureBuilder<bool>(
//         future: check(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show a loading spinner while waiting for the check
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             // Handle error
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             // Navigate based on the result of the check
//             return snapshot.data == true
//                 ? HomeScreen()
//                 : const SplashScreen();
//           }
//         },
//       ),
//     );
//   }
// }
