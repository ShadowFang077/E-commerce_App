import 'package:e_commerce_application/screens/splash_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerForApp extends StatefulWidget {
  const DrawerForApp({super.key});

  @override
  State<DrawerForApp> createState() => _DrawerForAppState();
}

class _DrawerForAppState extends State<DrawerForApp> {
  @override
  Widget build(BuildContext context) {
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
              Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SplashLogin(),
                      ),
                    );
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