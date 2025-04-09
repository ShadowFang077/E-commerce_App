import 'package:e_commerce_application/prodcuts_screens/kids.dart';
import 'package:e_commerce_application/prodcuts_screens/mens.dart';
import 'package:e_commerce_application/prodcuts_screens/womens.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_application/prodcuts_screens/fashion.dart';
import 'package:e_commerce_application/prodcuts_screens/beauty.dart';

class ContainerSlides extends StatelessWidget {
  const ContainerSlides({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffFFFFFF)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Beauty()));
            },
            child: Container(
              height: 130,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/Component 52.png'),
                  ),
                  Text('Beauty')
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Fashion()));
            },
            child: Container(
              height: 130,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/unsplash__3Q3tsJ01nc.png'),
                  ),
                  Text('Fashion')
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Kids(),
                ),
              );
            },
            child: Container(
              height: 130,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/unsplash_GCDjllzoKLo.png'),
                  ),
                  Text('Kids')
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Mens()));
            },
            child: Container(
              height: 71,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/Component 55.png'),
                  ),
                  Text("Men's")
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Womens(),
                ),
              );
            },
            child: Container(
              height: 50,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/unsplash_OYYE4g-I5ZQ.png'),
                  ),
                  Text("Women's"),
                ],
              ),
            ),
          ),
          SizedBox(height: 0),
    
          // SizedBox(width: 10)
        ],
      ),
    );
  }
}