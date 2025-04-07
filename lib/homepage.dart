// import 'dart:math';

// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   double secondContainer = 100;
//   double secondContainers = 90;
//   Color firstContainerColor = Colors.red;

//   randoms() {}
//   generateRandomColor() {
//     Random random = Random();
//     setState(() {
//       firstContainerColor = Color.fromARGB(
//           255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
//     });
//   }

//   double generateRandomNumber() {
//     var random = Random();
//     return random.nextInt(301) + 100; // Generates a number from 100 to 500
//   }

//   random() {
//     secondContainer = generateRandomNumber();

//     secondContainers = generateRandomNumber();

//     setState(() {});
//   }

   
//   dynamic bar() {
//     ScaffoldMessenger.of(context).removeCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Congrats your score is increased to $score'),
//       duration: Duration(seconds: 1),
//     ));

// // ScaffoldMessenger.of(context).showSnackBar(snackbarsnackBar(
// //   context:Text("congrats your score is increased"),
// //   Duration(seconds: 1),
// // ));
//   }

//   int score = 0;
//   increaseScore() async {
//     // await Future.delayed(Duration(seconds: 1));
//     setState(() {
//       score++;
//     });
//     bar();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 20,
//         children: [
//           Padding(padding: EdgeInsets.all(20)),
           
//           Center(
//             child: Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 shape: BoxShape.circle,
//               ),
//               child:
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset('assets/fashion shop-rafiki 1.png'),
//               ),
              

//               // child:CircleAvatar(
//               //   radius: 30.0,
//               //   backgroundImage:
//               //   backgroundColor: Colors.transparent,
//               // )
//             ),
//           ),
//           SizedBox(height: 40,),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Name : ",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(width: 30),
//               Text("I dont know",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
//             ],
//           ),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Role : ",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(width: 30),
//               Text("Your desired role",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
//             ],
//           ),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("score:",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(width: 30),
//               Text("$score",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             ],
//           ),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               ElevatedButton(
//                 onPressed: increaseScore,
//                 child: Text(
//                   "+",
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: increaseScore,
//         child: Text(
//           "+",
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
