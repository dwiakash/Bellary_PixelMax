import 'package:bellaryapp/constants/assets/local_images.dart';
import 'package:flutter/material.dart';
import '../models/on_board.dart';

class OnBoardProvider extends ChangeNotifier {
  OnBoard? _onBoardData;
  OnBoard? get onBoardData => _onBoardData;
  set onBoardData(OnBoard? data) {
    _onBoardData = data;
    notifyListeners();
  }

  List<OnBoard> get onBoardList => OnBoard.fromJsonList(_onBoardList);
  final List _onBoardList = [
    {
      'image': LocalImages.onboarding1,
      'title': 'Grocery Shopping and Local Shops',
      'desc1':
          "Effortless Grocery Shopping Browse a wide range of products from local Shops and have them delivered quickly.",
      'desc2':
          "Explore Local Shops Shop from your favorite local businesses and discover unique products.",
    },
    {
      'image': LocalImages.onboarding2,
      'title': 'Service Booking and Multi-Language Support',
      'desc1':
          "Book Local Services Find and book trusted professionals for various needs.",
      'desc2':
          "Multi-Language Support Choose your preferred language for a more personalized experience.",
    },
  ];
}
