import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // List<Service> _services = [];
  // List<Service> get services => _services;
  // set services(List<Service> services) {
  //   _services = services;
  //   notifyListeners();
  // }
}
