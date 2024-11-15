import 'package:bellaryapp/models/category.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Category> _productCategories = [];
  List<Category> get productCategories => _productCategories;
  set productCategories(List<Category> productCategories) {
    _productCategories = productCategories;
    notifyListeners();
  }

  List<Category> _serviceCategories = [];
  List<Category> get serviceCategories => _serviceCategories;
  set serviceCategories(List<Category> serviceCategories) {
    _serviceCategories = serviceCategories;
    notifyListeners();
  }
}
