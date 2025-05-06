// import '../models/product_model.dart';

// final List<Map<String, dynamic>> productsData = [
//   {
//     'name': "Pilot's Watch",
//     'description': "IWC Schaffhausen 2021 Pilot's Watch",
//     'image': 'assets/Mask Group1.3.png',
//     'actualPrice': '₹1599',
//     'discount': '60%Off',
//     'itemPrice': '₹650',
//     'ratingNumber': '10,23,456',
//     'productType': 'watch'
//   },
//   {
//     "name": "Pilot's Watch",
//     "description": "IWC Schaffhausen 2021 Pilot's Watch",
//     "image": "assets/Mask Group1.3.png",
//     "actualPrice": "₹1599",
//     "discount": "60%Off",
//     "itemPrice": "₹650",
//     "ratingNumber": "10,23,456",
//     "productType": "watch"
//   },
//   {
//     "name": "Product 1",
//     "description": "Description for Product 1",
//     "image": "assets/product_1.png",
//     "actualPrice": "₹1010",
//     "discount": "20%Off",
//     "itemPrice": "₹808",
//     "ratingNumber": "1000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 2",
//     "description": "Description for Product 2",
//     "image": "assets/product_2.png",
//     "actualPrice": "₹1020",
//     "discount": "30%Off",
//     "itemPrice": "₹714",
//     "ratingNumber": "2000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 3",
//     "description": "Description for Product 3",
//     "image": "assets/product_3.png",
//     "actualPrice": "₹1030",
//     "discount": "40%Off",
//     "itemPrice": "₹618",
//     "ratingNumber": "3000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 4",
//     "description": "Description for Product 4",
//     "image": "assets/product_4.png",
//     "actualPrice": "₹1040",
//     "discount": "50%Off",
//     "itemPrice": "₹520",
//     "ratingNumber": "4000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 5",
//     "description": "Description for Product 5",
//     "image": "assets/product_5.png",
//     "actualPrice": "₹1050",
//     "discount": "15%Off",
//     "itemPrice": "₹892",
//     "ratingNumber": "5000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 6",
//     "description": "Description for Product 6",
//     "image": "assets/product_6.png",
//     "actualPrice": "₹1060",
//     "discount": "25%Off",
//     "itemPrice": "₹795",
//     "ratingNumber": "6000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 7",
//     "description": "Description for Product 7",
//     "image": "assets/product_7.png",
//     "actualPrice": "₹1070",
//     "discount": "35%Off",
//     "itemPrice": "₹696",
//     "ratingNumber": "7000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 8",
//     "description": "Description for Product 8",
//     "image": "assets/product_8.png",
//     "actualPrice": "₹1080",
//     "discount": "45%Off",
//     "itemPrice": "₹594",
//     "ratingNumber": "8000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 9",
//     "description": "Description for Product 9",
//     "image": "assets/product_9.png",
//     "actualPrice": "₹1090",
//     "discount": "10%Off",
//     "itemPrice": "₹981",
//     "ratingNumber": "9000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 10",
//     "description": "Description for Product 10",
//     "image": "assets/product_10.png",
//     "actualPrice": "₹1100",
//     "discount": "20%Off",
//     "itemPrice": "₹880",
//     "ratingNumber": "10000",
//     "productType": "electronics"
//   },
//    {
//     "name": "Product 11",
//     "description": "Description for Product 11",
//     "image": "assets/product_11.png",
//     "actualPrice": "₹1110",
//     "discount": "25%Off",
//     "itemPrice": "₹832",
//     "ratingNumber": "11000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 12",
//     "description": "Description for Product 12",
//     "image": "assets/product_12.png",
//     "actualPrice": "₹1120",
//     "discount": "35%Off",
//     "itemPrice": "₹728",
//     "ratingNumber": "12000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 13",
//     "description": "Description for Product 13",
//     "image": "assets/product_13.png",
//     "actualPrice": "₹1130",
//     "discount": "45%Off",
//     "itemPrice": "₹621",
//     "ratingNumber": "13000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 14",
//     "description": "Description for Product 14",
//     "image": "assets/product_14.png",
//     "actualPrice": "₹1140",
//     "discount": "10%Off",
//     "itemPrice": "₹1026",
//     "ratingNumber": "14000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 15",
//     "description": "Description for Product 15",
//     "image": "assets/product_15.png",
//     "actualPrice": "₹1150",
//     "discount": "20%Off",
//     "itemPrice": "₹920",
//     "ratingNumber": "15000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 16",
//     "description": "Description for Product 16",
//     "image": "assets/product_16.png",
//     "actualPrice": "₹1160",
//     "discount": "30%Off",
//     "itemPrice": "₹812",
//     "ratingNumber": "16000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 17",
//     "description": "Description for Product 17",
//     "image": "assets/product_17.png",
//     "actualPrice": "₹1170",
//     "discount": "40%Off",
//     "itemPrice": "₹702",
//     "ratingNumber": "17000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 18",
//     "description": "Description for Product 18",
//     "image": "assets/product_18.png",
//     "actualPrice": "₹1180",
//     "discount": "50%Off",
//     "itemPrice": "₹590",
//     "ratingNumber": "18000",
//     "productType": "electronics"
//   },
//   {
//     "name": "Product 19",
//     "description": "Description for Product 19",
//     "image": "assets/product_19.png",
//     "actualPrice": "₹1190",
//     "discount": "15%Off",
//     "itemPrice": "₹1011",
//     "ratingNumber": "19000",
//     "productType": "fashion"
//   },
//   {
//     "name": "Product 20",
//     "description": "Description for Product 20",
//     "image": "assets/product_20.png",
//     "actualPrice": "₹1200",
//     "discount": "25%Off",
//     "itemPrice": "₹900",
//     "ratingNumber": "20000",
//     "productType": "electronics"
//   },


 
// ];

// final List<Product> products = productsData.map((item) => Product.fromJson(item)).toList();
