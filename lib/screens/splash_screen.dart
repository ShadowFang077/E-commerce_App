import 'package:e_commerce_application/bin/splash_login.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
int index =0;
 List numlist = [
  Text('1',style: TextStyle(color: Color(0xff000000),),),
  Text('2',style: TextStyle(color: Color(0xff000000),),),
  Text('3',style: TextStyle(color: Color(0xff000000),),)
 ];
  List imgList = [   
    Image.asset('assets/fashion shop 1.png',width:300,height: 300,), 
    Image.asset('assets/Sales consulting 1.png',width:300,height: 300,), 
    Image.asset('assets/Shopping bag-1.png',width:300,height: 300,), 
  ];
List headlist =[
  Text('Choose Products',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff000000)   ),),
  Text('Make Payment',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff000000)   ),),
  Text('Get Your Order',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff000000)   ),),
];
List textlist =[
  Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xffa8a8a9),),),
  Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xffa8a8a9),),),
  Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xffa8a8a9),),),
];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
       SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
              SizedBox(height: 40),
              Row(
                
              children: [
                SizedBox(width: 20),
                numlist[index],
                Text('/3',
                style: TextStyle(color: Color(0xffA0A0A1),),),
                SizedBox(width:270 ),
                Text('Skip',
                style: TextStyle(color: Color(0xff000000),fontSize: 16,fontWeight: FontWeight.bold),),
                
              ],
              ),
              SizedBox(height: 70),
              Column(
                
              children: [
              
               imgList[index],
           SizedBox(height: 20),
                headlist[index],
                SizedBox(height: 10),
               textlist[index],
                
                
              SizedBox(height: 60),
              
              
              SizedBox(height: 70),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                
                
            TextButton(
              onPressed:   index ==2 ? (
              ){
          Navigator.push<void>(
             context,
             MaterialPageRoute<void>(
               builder: (BuildContext context) => const SplashLogin(),
             ),
           );              
              }:(
                
              ){
         
                setState(() {
                  index = index+1;
                });
              },
              child: Text(
             index ==2 ? 'Get stated': 'Next',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),
              ),
            )
              ],
            ),
            ],
              
             
         ),
       ),
            
       
    );
  
  }
}