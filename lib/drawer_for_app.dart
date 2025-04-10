import 'package:e_commerce_application/app/bloc/app_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerForApp extends StatefulWidget {
  const DrawerForApp({super.key});

  @override
  State<DrawerForApp> createState() => _DrawerForAppState();
}

class _DrawerForAppState extends State<DrawerForApp> {
  @override
  Widget build(BuildContext context) {
        final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return 
     Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(onPressed: () async {
                SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                    preferences.setBool('loggedin', false);
                                  context.read<AppBloc>().add(const AppLogoutPressed());


              },
              style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF83758),
                    minimumSize: Size(317, 55), // Width: 200, Height: 60
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
              child: Text('Log Out',style: TextStyle(color: Color(0xffFFFFFF)),),),
            )
          ],
        ),
      )
    ;
  }
}