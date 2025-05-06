import 'package:e_commerce_application/app/bloc/app_bloc.dart';
 import 'package:e_commerce_application/login/view/login_page.dart';
import 'package:e_commerce_application/home/view/home_screen.dart';
import 'package:flutter/widgets.dart';
 

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeNavBarScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
