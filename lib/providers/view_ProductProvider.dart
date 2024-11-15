import 'package:bellaryapp/models/view.product.dart';
import 'package:flutter/material.dart';

class ViewProductProvider with ChangeNotifier {
  // Sample Product Data
  Product _product = Product(
    name: 'Leather Crossbody Bag',
    mainImageUrl: 'assets/images/purse.png', // Main image
    images: [
      'assets/images/purse.png',
      'assets/images/purse.png',
      'assets/images/purse.png',
    ], // List of additional images
    price: 9200,
    availableColors: ['Gray', 'White', 'Black'],
    availableModels: ['Small', 'Medium', 'Large'],
    services: ['Anti Stain Massage', 'Dry Massage'],
    description:
        'Stylish leather bag with adjustable\n strap and sleek design.',
  );

  // Default selected values
  String _selectedColor = 'Gray'; // Default color
  String _selectedModel = 'Small'; // Default model
  List<String> _selectedServices = [];
  int _currentImageIndex = 0; // Default image index for the slider

  // Getters to expose product data and current selections
  Product get product => _product;
  String get selectedColor => _selectedColor;
  String get selectedModel => _selectedModel;
  List<String> get selectedServices => _selectedServices;
  int get currentImageIndex => _currentImageIndex;

  // Method to update the selected color
  void selectColor(String color) {
    _selectedColor = color;
    notifyListeners();
  }

  // Method to update the selected model
  void selectModel(String model) {
    _selectedModel = model;
    notifyListeners();
  }

  // Method to toggle services (add or remove a service)
  void toggleService(String service) {
    if (_selectedServices.contains(service)) {
      _selectedServices.remove(service);
    } else {
      _selectedServices.add(service);
    }
    notifyListeners();
  }

  // Method to check if a service is selected
  bool isServiceSelected(String service) {
    return _selectedServices.contains(service);
  }

  // Method to update the current image index for the slider
  void updateImageIndex(int index) {
    _currentImageIndex = index;
    notifyListeners();
  }
}
