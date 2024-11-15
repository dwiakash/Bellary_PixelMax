import 'package:flutter/material.dart';

class FeedbackProvider with ChangeNotifier {
  int _rating = 4; // Default rating
  String _comment = '';

  int get rating => _rating;
  String get comment => _comment;

  void setRating(int rating) {
    _rating = rating;
    notifyListeners();
  }

  void setComment(String comment) {
    _comment = comment;
    notifyListeners();
  }
}
