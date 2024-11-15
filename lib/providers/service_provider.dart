import 'package:bellaryapp/models/service.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Service> _services = [];
  List<Service> get services => _services;
  set services(List<Service> services) {
    _services = services;
    notifyListeners();
  }

  List<Service> _mostBookedServices = [];
  List<Service> get mostBookedServices => _mostBookedServices;
  set mostBookedServices(List<Service> mostBookedServices) {
    _mostBookedServices = mostBookedServices;
    notifyListeners();
  }
}
