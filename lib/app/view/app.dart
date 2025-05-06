import 'package:authentication_repository/authentication_repository.dart';
 import 'package:e_commerce_application/App_data/trending_products.dart';
import 'package:e_commerce_application/app/bloc/app_bloc.dart';
import 'package:e_commerce_application/app/routes/routes.dart';
import 'package:e_commerce_application/app/view/firebasedataupload.dart';
import 'package:e_commerce_application/data/data.dart';
import 'package:e_commerce_application/data/jsondata.dart';
 import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        )..add(const AppUserSubscriptionRequested()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});



  @override
  Widget build(BuildContext context) {
   wdata();
   writedata();
   readdata();
       rdata();
    return MaterialApp(
      theme: ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 113, 243, 230),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0097A7),
    secondary: Color(0xFF009688),
    surface: Color(0xFFE0F2F1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}

 Future<void> wdata(
  
) async {
  try {
  addOrUpdateCarouselImages(
   imgList:  imgList,
    productId: 'productId',
  );
    print('Product added successfully!');
  } catch (e) {
    print('Error adding product: $e');
  }
}
 

rdata(){
  getCarouselImages('productId').then((images) {
    Data().carouselSliderImages = images;
    print('Fetched images: $images');
  }).catchError((error) {
    print('Error fetching images: $error');
  });
}

Future<void> writedata(
) async {
  try {
  addOrUpdateProductData(
   trendingJsonDatas: trendingJsonDatas.cast<Map<String, dynamic>>(),
    productIds: 'productIds',
  );
    print('Product added successfully!');
  } catch (e) {
    print('Error adding product: $e');
  }
}

readdata(){
  getProductData('productIds').then((productImages) {
    Data().trendingProduct = productImages.map((item) => TrendingProducts.fromJson(item)).toList();
    print('Fetched images: $productImages');
  }).catchError((error) {
    print('Error fetching images: $error');
  });
}
