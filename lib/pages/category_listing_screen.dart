import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/model/category.dart';
import 'package:test_project/pages/product_listing_screen.dart';
import 'package:test_project/services/categoryselectionservice.dart';
import 'package:test_project/services/categoryservices.dart';
import 'package:test_project/utils/helper.dart';
import 'package:test_project/widget/categorycard.dart';

class category_listing_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
    List<Category> categories = catService.getCategories();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Text('Categories',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return CategoryCard(
                    category: categories[index],
                    onCardClick: () {
                      catSelection.selectedCategory = categories[index];
                      catSelection.getProductsCollectionFromFirebase()
                          .then((value) {
                        Utils.mainAppNav.currentState!.push(MaterialPageRoute(builder: (context) => product_listing_screen()));
                      });

                    }
                );
              },
            ),
          )
        ]
    );
  }
}