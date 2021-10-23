import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/category_listing_screen.dart';
import 'package:test_project/utils/helper.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Navigator(
                      key: Utils.mainListNav,
                      initialRoute: '/',
                      onGenerateRoute: (RouteSettings settings) {
                        return PageRouteBuilder(
                            pageBuilder: (_, __, ___) => category_listing_screen(),
                            transitionDuration: const Duration(seconds: 0)
                        );
                      },
                    )
                ),

              ],
            )
        )
    );
  }
}