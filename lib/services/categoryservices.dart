import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_project/model/category.dart';

class CategoryService {
  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _categories = [];
    await FirebaseFirestore.instance.collection('categories').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Category model = new Category(name: doc["name"],imgName: doc["imgURL"]);
        _categories.add(model);
      });
    });
  }

}