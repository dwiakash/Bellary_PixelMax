import 'package:bellaryapp/models/city.dart';
import 'package:flutter/material.dart';

class CityProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _isGettingCities = false;
  bool get isGettingCities => _isGettingCities;
  set isGettingCities(bool val) {
    _isGettingCities = val;
    notifyListeners();
  }

  List<City> _cities = [];
  List<City> get cities => _cities;
  set cities(List<City> cities) {
    _cities = cities;
    notifyListeners();
  }
}
