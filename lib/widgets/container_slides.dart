
import 'package:e_commerce_application/products/beauty.dart';
import 'package:e_commerce_application/products/fashion.dart';
import 'package:e_commerce_application/products/kids.dart';
import 'package:e_commerce_application/products/mens.dart';
import 'package:e_commerce_application/products/womens.dart';
import 'package:flutter/material.dart';

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
                        NetworkImage('https://static.india.com/wp-content/uploads/2023/07/close-up-collection-make-up-beauty-products.jpg?impolicy=Medium_Widthonly&w=700'),
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
                       NetworkImage('https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
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
                        NetworkImage('https://images.unsplash.com/photo-1566454544259-f4b94c3d758c?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                        NetworkImage('https://images.unsplash.com/photo-1608739872166-3ba1787f57e3?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
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
                        NetworkImage('https://plus.unsplash.com/premium_photo-1661351421471-b288544c3dda?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
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