import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_project/model/category.dart';
import 'package:test_project/model/product.dart';

class CategorySelectionService extends ChangeNotifier {

  Category? _selectedCategory;
  List<Product> _products = [];

  List<Product> getProducts() {
    return _products;
  }

  Category? get selectedCategory  => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  Future<void> getProductsCollectionFromFirebase() async {
    _products = [];
    await FirebaseFirestore.instance.collection('products').where('category',isEqualTo: _selectedCategory?.name).get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Product model = new Product(name: doc["name"],imgName: doc["imgURL"]);
        _products.add(model);
      });
    });
  }


}