import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/mainpage.dart';
import 'package:test_project/pages/product_listing_screen.dart';
import 'package:test_project/pages/splashpage.dart';
import 'package:test_project/services/categoryselectionservice.dart';
import 'package:test_project/services/categoryservices.dart';
import 'package:test_project/utils/helper.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (_) => CategorySelectionService()
            ),
            Provider(
                create: (_) => CategoryService()
            )
          ],
          child: MaterialApp(
            navigatorKey: Utils.mainAppNav,
            theme: ThemeData(fontFamily: 'Raleway'),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => SplashPage(duration: 3),
              '/mainpage': (context) => MainPage(),
              '/showproducts': (context) => product_listing_screen(),
            },

          )
      )
  );
}