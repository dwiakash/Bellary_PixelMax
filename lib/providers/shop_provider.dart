import 'package:bellaryapp/models/shop.dart';
import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Shop> _shops = [];
  List<Shop> get shops => _shops;
  set shops(List<Shop> shops) {
    _shops = shops;
    notifyListeners();
  }
}
