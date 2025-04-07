  import 'package:demo_1/App_data/bottom,_card_Data.dart';
import 'package:demo_1/App_data/product_model.dart';
import 'package:demo_1/App_data/trending_products.dart';




 final bottomData =[

    {
      'name': "Pilot's Watch",
      'description': '''IWC Schaffhausen 2021 Pilot's Watch "SIHH 2019" 44mm''',
      'image': 'assets/Mask Group1.3.png',
      'actualPrice': '₹1599',
      'discount': '60%Off',
      'itemPrice': '₹650',
      'ratingNumber': '10,23,456'

    },
    {
      'name': "Mens Starry",
      'description': 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      'image': 'assets/unsplash_0vsk2_9dkqo5.png',
      'actualPrice': '₹1200',
      'discount': '64% off',
      'itemPrice': '₹399',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'Sneakers',
      'description': "Labbin White Sneakers For Men and Female",
      'image': 'assets/Mask Group2.4.png',
      'actualPrice': '₹1250',
      'discount': '70% off',
      'itemPrice': '₹650',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'Black Jacket 12...',
      'description': 'This warm and comfortable jacket is great for learni...',
      'image': 'assets/unsplash_0vsk2_9dkqo.png',
      'actualPrice': '₹4,999',
      'discount': '50% off',
      'itemPrice': '₹2,999',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'HRX by Hrithik Roshan',
      'description': 'Neque porro quisquam est qui dolorem ipsum quia',
      'image': 'assets/Mask Group 1.2.png',
      'actualPrice': '₹4999',
      'discount': '50%Off',
      'itemPrice': '₹2499',
      'ratingNumber': '10,23,456'

    },
  ];
   List<Bottom> bottomCards = bottomData.map((item) => Bottom.fromJson(item)).toList();
   
   List<Map<String, String>> productDetails = [
    {
      'details' :   "Perhaps the most iconic sneaker of all-time, this original \"Chicago\"? colorway is the cornerstone to any sneaker  collection. Made famous in 1985 by Michael Jordan, the  shoe has stood the test of time, becoming the most  famous colorway of the Air Jordan 1."
    }
   ];
   final jsonData = [
    {
      'name': 'Women Printed Kurta',
      'description': 'Neque porro quisquam est qui dolorem ipsum quia',
      'image': 'assets/Mask Groups.png',
      'actualPrice': '₹2499',
      'discount': '40%Off',
      'itemPrice': '₹1500',
      'ratingNumber': '10,23,456'
    },
    {
      'name': 'HRX by Hrithik Roshan',
      'description': 'Neque porro quisquam est qui dolorem ipsum quia',
      'image': 'assets/Mask Group 1.2.png',
      'actualPrice': '₹4999',
      'discount': '50%Off',
      'itemPrice': '₹2499',
      'ratingNumber': '10,23,456'
    },
    {
      'name': "Pilot's Watch",
      'description': '''IWC Schaffhausen
2021 Pilot's Watch "SIHH 2019" 44mm''',
      'image': 'assets/Mask Group1.3.png',
      'actualPrice': '₹1599',
      'discount': '60% off',
      'itemPrice': '₹650',
      'ratingNumber': '10,23,456'
    },
    {
      'name': 'Sneakers',
      'description': '''Labbin White Sneakers
For Men and Female''',
      'image': 'assets/Mask Group2.4.png',
      'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456',
      'itemPrice': '₹650',
    },
    {
      'name': 'Black Jacket 12...',
      'description': 'This warm and comfortable jacket is great for learni...',
      'image': 'assets/unsplash_0vsk2_9dkqo.png',
      'actualPrice': '₹4,999',
      'discount': '50% off',
      'itemPrice': '₹2,999',
      'ratingNumber': '10,23,456'
    },
  ];

  // Convert the list of maps to a list of Product objects
  List<Product> products = jsonData.map((item) => Product.fromJson(item)).toList();


final trendingJsonDatas = [
  {
      'name': 'Black Winter...',
      'description': 'Autumn And Winter Casual cotton-padded jacket...',
      'image':  ['assets/unsplash_NoVnXXmDNi0-.png','assets/unsplash_NoVnXXmDNi0-.png','assets/unsplash_NoVnXXmDNi0-.png','assets/unsplash_NoVnXXmDNi0-.png'],
      'itemPrice': '₹499',
      'ratingNumber': '6,890',
       'actualPrice': '₹1250',
      'discount': '70% off',
      
  },
   {
      'name': 'Black Dress    ',
      'description': 'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
      'image': ['assets/unsplash_yTBMYCcZQRs.png','assets/unsplash_yTBMYCcZQRs.png','assets/unsplash_yTBMYCcZQRs.png','assets/unsplash_yTBMYCcZQRs.png'],
      'itemPrice': '₹2000',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '5,23,456'
  },
  {
      'name': 'Flare Dress  ',
      'description': 'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
      'image': ['assets/unsplash_9U18fiowwbw.png','assets/unsplash_9U18fiowwbw.png','assets/unsplash_9U18fiowwbw.png','assets/unsplash_9U18fiowwbw.png'],
      'itemPrice': '₹1990',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '3,35,566'
  },
   {
      'name': 'Jordan Stay ',
      'description': "The classic Air Jordan 12 to create a shoe that's frees...",
      'image': ['assets/unsplash_yTBMYCcZQRs (1).png','assets/unsplash_yTBMYCcZQRs (1).png','assets/unsplash_yTBMYCcZQRs (1).png','assets/unsplash_yTBMYCcZQRs (1).png'],
      'itemPrice': '₹4,999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'
  },
   {
      'name': 'Sony PS4 ',
      'description': 'Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...',
      'image': ['assets/unsplash_9U18fiowwbw (1).png','assets/unsplash_9U18fiowwbw (1).png','assets/unsplash_9U18fiowwbw (1).png','assets/unsplash_9U18fiowwbw (1).png'],
      'itemPrice': '₹1,999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '8,35,566'
  },
   {
      'name': 'D7200 Digital C... ',
      'description': 'D7200 Digital Camera (Nikon) In New Area...',
      'image': ['assets/unsplash_yTBMYCcZQRs (2).png','assets/unsplash_yTBMYCcZQRs (2).png','assets/unsplash_yTBMYCcZQRs (2).png','assets/unsplash_yTBMYCcZQRs (2).png'],
      'itemPrice': '₹26,999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '67,456'
  }, 
  {
      'name': 'Mens Starry  ',
      'description': 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      'image': ['assets/unsplash_0vsk2_9dkqo5.png','assets/unsplash_0vsk2_9dkqo5.png','assets/unsplash_0vsk2_9dkqo5.png','assets/unsplash_0vsk2_9dkqo5.png'],
      'itemPrice': '₹399',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '1,52,344'
  },
   {
      'name': 'Pink Embroide... ',
      'description': 'EARTHEN Rose Pink Embroidered Tiered Max...',
      'image': ['assets/unsplash_Pdds9XsWyoM.png','assets/unsplash_Pdds9XsWyoM.png','assets/unsplash_Pdds9XsWyoM.png','assets/unsplash_Pdds9XsWyoM.png'],
      'itemPrice': '₹1,900',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '45,678'
  },
 {
      'name': 'denim dress  ',
      'description': 'Blue cotton denim dress Look 2 Printed cotton dr...',
      'image': ['assets/unsplash_0vsk2_9dkqo (1).png','assets/unsplash_0vsk2_9dkqo (1).png','assets/unsplash_0vsk2_9dkqo (1).png','assets/unsplash_0vsk2_9dkqo (1).png'],
      'itemPrice': '₹999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '27,344'
  },
 {
      'name': 'Realme 7   ',
      'description': '6 GB RAM | 64 GB ROM | Expandable Upto 256...',
      'image': ['assets/unsplash_Pdds9XsWyoM (1).png','assets/unsplash_Pdds9XsWyoM (1).png','assets/unsplash_Pdds9XsWyoM (1).png','assets/unsplash_Pdds9XsWyoM (1).png'],
      'itemPrice': '₹3,499',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '3,44,567'
  },
  {
      'name': 'Black Jacket 12...  ',
      'description': 'This warm and comfortable jacket is great for learni...',
      'image': ['assets/unsplash_0vsk2_9dkqo.png','assets/unsplash_0vsk2_9dkqo.png','assets/unsplash_0vsk2_9dkqo.png','assets/unsplash_0vsk2_9dkqo.png'],
      'itemPrice': '₹2,999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '2,23,569'
  },
  {
      'name': "men's & boys s...  ",
      'description': 'George Walker Derby Brown Formal Shoes',
      'image': ['assets/unsplash_Pdds9XsWyoM (1).png','assets/unsplash_Pdds9XsWyoM (1).png','assets/unsplash_Pdds9XsWyoM (1).png','assets/unsplash_Pdds9XsWyoM (1).png'],
      'itemPrice': '₹999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '13,45,678'
  },
   {
      'name': 'Black Dress    ',
      'description': 'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
      'image': ['assets/unsplash_yTBMYCcZQRs.png','assets/unsplash_yTBMYCcZQRs.png','assets/unsplash_yTBMYCcZQRs.png','assets/unsplash_yTBMYCcZQRs.png'],
      'itemPrice': '₹2000',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '5,23,456'
  },
  {
      'name': 'Flare Dress  ',
      'description': 'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
      'image': ['assets/unsplash_9U18fiowwbw.png','assets/unsplash_9U18fiowwbw.png','assets/unsplash_9U18fiowwbw.png','assets/unsplash_9U18fiowwbw.png'],
      'itemPrice': '₹1990',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '3,35,566'
  },
  {
      'name': "Pilot's Watch",
      'description': '''IWC Schaffhausen 2021 Pilot's Watch "SIHH 2019" 44mm''',
      'image': ['assets/Mask Group1.3.png','assets/Mask Group1.3.png','assets/Mask Group1.3.png','assets/Mask Group1.3.png'],
      'itemPrice': '₹650',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
    {
      'name': "Mens Starry",
      'description': 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      'image': ['assets/unsplash_0vsk2_9dkqo5.png','assets/unsplash_0vsk2_9dkqo5.png','assets/unsplash_0vsk2_9dkqo5.png','assets/unsplash_0vsk2_9dkqo5.png'],
      'itemPrice': '₹399',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'Sneakers',
      'description': "Labbin White Sneakers For Men and Female",
      'image': ['assets/Mask Group2.4.png','assets/Mask Group2.4.png','assets/Mask Group2.4.png','assets/Mask Group2.4.png'],
      'ratingNumber': '10,23,456',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'itemPrice': '₹650',
    },
    {
      'name': 'Black Jacket 12...',
      'description': 'This warm and comfortable jacket is great for learni...',
      'image': ['assets/unsplash_0vsk2_9dkqo.png','assets/unsplash_0vsk2_9dkqo.png','assets/unsplash_0vsk2_9dkqo.png','assets/unsplash_0vsk2_9dkqo.png'],
      'itemPrice': '₹2,999',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'HRX by Hrithik Roshan',
      'description': 'Neque porro quisquam est qui dolorem ipsum quia',
      'image': ['assets/Mask Group 1.2.png','assets/Mask Group 1.2.png','assets/Mask Group 1.2.png','assets/Mask Group 1.2.png'],
      'itemPrice': '₹2499',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'Women Printed Kurta',
      'description': 'Neque porro quisquam est qui dolorem ipsum quia',
      'image': ['assets/Mask Groups.png','assets/Mask Groups.png','assets/Mask Groups.png','assets/Mask Groups.png'],
      'ratingNumber': '10,23,456',
       'actualPrice': '₹1250',
      'discount': '70% off',
    
      'itemPrice': '₹1500',
    },
    {
      'name': 'HRX by Hrithik Roshan',
      'description': 'Neque porro quisquam est qui dolorem ipsum quia',
      'image': ['assets/Mask Group 1.2.png','assets/Mask Group 1.2.png','assets/Mask Group 1.2.png','assets/Mask Group 1.2.png'],
      'itemPrice': '₹2499',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
    {
      'name': "Pilot's Watch",
      'description': '''IWC Schaffhausen 2021 Pilot's Watch "SIHH 2019" 44mm''',
      'image': ['assets/Mask Group1.3.png','assets/Mask Group1.3.png','assets/Mask Group1.3.png','assets/Mask Group1.3.png'],
      'itemPrice': '₹650',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
    {
      'name': 'Sneakers',
      'description': '''Labbin White Sneakers For Men and Female''',
      'image': ['assets/Mask Group2.4.png','assets/Mask Group2.4.png','assets/Mask Group2.4.png','assets/Mask Group2.4.png',],
      'itemPrice': '₹650',
       'actualPrice': '₹1250',
      'discount': '70% off',
      'ratingNumber': '10,23,456'

    },
];

List<TrendingProducts> trendingProduct = trendingJsonDatas.map((item) => TrendingProducts.fromJson(item)).toList();


