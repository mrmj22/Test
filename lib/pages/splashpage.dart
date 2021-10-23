import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/mainpage.dart';
import 'package:test_project/services/categoryservices.dart';
import 'package:test_project/utils/AppColor.dart';
import 'package:test_project/utils/helper.dart';

class SplashPage extends StatelessWidget {
  int? duration = 0;

  SplashPage({  this.duration });


  @override
  Widget build(BuildContext context) {
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);

    Future.delayed(Duration(seconds: this.duration!), () async {

      // await for the Firebase initialization to occur
      await Firebase.initializeApp();

      catService.getCategoriesCollectionFromFirebase()
          .then((value) {
        Utils.mainAppNav.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
      });
    });

    return Material(
        child: Container(
            color: AppColor.primarySwatchColor,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}