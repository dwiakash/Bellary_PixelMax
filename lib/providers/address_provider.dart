import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  String? _address;
  String? _pinCode;
  String? _buildingName;

  Position? get currentPosition => _currentPosition;
  String? get address => _address;
  String? get pinCode => _pinCode;
  String? get buildingName => _buildingName;

  void setCurrentPosition(Position position) {
    _currentPosition = position;
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setPinCode(String pinCode) {
    _pinCode = pinCode;
    notifyListeners();
  }

  void setBuildingName(String name) {
    _buildingName = name;
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setCurrentPosition(position);
  }
}
