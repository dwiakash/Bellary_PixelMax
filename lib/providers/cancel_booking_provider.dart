import 'package:flutter/material.dart';

class CancelBookingProvider with ChangeNotifier {
  String? _selectedReason;
  String? _comment;

  String? get selectedReason => _selectedReason;
  String? get comment => _comment;

  void setSelectedReason(String? reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  void setComment(String comment) {
    _comment = comment;
    notifyListeners();
  }
}
