

// import 'package:flutter/material.dart';



// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final PageController _pageController = PageController(viewportFraction: 0.8);
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       int next = _pageController.page!.round();
//       if (_currentPage != next) {
//         setState(() {
//           _currentPage = next;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {
//             // Implement menu functionality
//           },
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/logo.png', // Replace with your logo asset path
//               height: 30,
//             ),
//             SizedBox(width: 8),
//             Text('Stylish'),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.mic),
//             onPressed: () {
//               // Implement voice search functionality
//             },
//           ),
//           CircleAvatar(
//             radius: 18,
//             backgroundImage: AssetImage(
//                 'assets/profile.jpg'), // Replace with your profile image asset path
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('All Featured'),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.sort),
//                         onPressed: () {
//                           // Implement sort functionality
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.filter_list),
//                         onPressed: () {
//                           // Implement filter functionality
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 150, // Increased height for slider images
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: 8, // Replace with actual category count
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0),
//                       child: Image.asset(
//                         'assets/category_$index.jpg', // Replace with category slider images
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List<Widget>.generate(
//                 8, // Replace with actual category count
//                 (int index) {
//                   return Container(
//                     width: 8.0,
//                     height: 8.0,
//                     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _currentPage == index
//                           ? Color.fromRGBO(0, 0, 0, 0.9)
//                           : Color.fromRGBO(0, 0, 0, 0.4),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // ... (Rest of the code remains the same)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset('assets/summer_sale.png'), // Replace with your summer sale banner
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'New Arrivals',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('Summer\' 25 Collections'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Implement view all functionality
//                 },
//                 child: Text('View All'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Sponserd',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 alignment: Alignment.bottomLeft,
//                 children: [
//                   Image.asset('assets/shoes.png'), // Replace with your shoes image
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'UP TO 50% OFF',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('up to 50% off'),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//       ),
//     );
//   }
// }