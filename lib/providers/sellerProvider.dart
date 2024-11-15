import 'package:bellaryapp/models/sellerModel.dart';
import 'package:flutter/material.dart';

class SellerProvider with ChangeNotifier {
  SellerModel _seller = SellerModel(
    name: '',
    businessName: '',
    email: '',
    phone: '',
    address: '',
  );

  SellerModel get seller => _seller;

  void updateName(String newName) {
    _seller.name = newName;
    notifyListeners();
  }

  void updateBusinessName(String newBusinessName) {
    _seller.businessName = newBusinessName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _seller.email = newEmail;
    notifyListeners();
  }

  void updatePhone(String newPhone) {
    _seller.phone = newPhone;
    notifyListeners();
  }

  void updateAddress(String newAddress) {
    _seller.address = newAddress;
    notifyListeners();
  }

  bool validateFields() {
    return _seller.name.isNotEmpty &&
        _seller.businessName.isNotEmpty &&
        _seller.email.isNotEmpty &&
        _seller.phone.isNotEmpty &&
        _seller.address.isNotEmpty;
  }
}
