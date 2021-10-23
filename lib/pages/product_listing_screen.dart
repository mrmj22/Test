import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test_project/model/product.dart';
import 'package:test_project/services/categoryselectionservice.dart';
import 'package:test_project/widget/productCard.dart';

class product_listing_screen extends StatelessWidget {
  const product_listing_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    List<Product> products = catSelection.getProducts();

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Text('Products',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ProductCard(
                      product: products[index],
                      onCardClick: () {
                        Fluttertoast.showToast(msg: products[index].name.toString());
                      }
                  );
                },
              ),
            )
          ]
      ),
    );
  }
}
