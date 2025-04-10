import 'package:e_commerce_application/home/view/pages/profile.dart';
import 'package:flutter/material.dart';

class AppBarForAllScreens extends StatefulWidget {
  const AppBarForAllScreens({super.key});

  @override
  State<AppBarForAllScreens> createState() => _AppBarForAllScreensState();
}

class _AppBarForAllScreensState extends State<AppBarForAllScreens> {
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(width: 50),
            Image.asset('assets/logoipsum-255 1.png'),
            SizedBox(width: 19),
            Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile(name: 'r', email: 'sdflk',)));
              },
              child: Padding(
                padding: EdgeInsets.all(0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://thumbs.dreamstime.com/b/man-profile-cartoon-smiling-round-icon-vector-illustration-graphic-design-135443422.jpg'),
                ),
              ),
            ),
          ],
        );
  }
}