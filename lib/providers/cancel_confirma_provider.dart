import 'package:flutter/material.dart';

// Booking Model
class Booking {
  final String title;
  final String description;
  final String date;
  final String img;
  final double price;
  final int quantity;
  final int duration;

  Booking({
    required this.title,
    required this.description,
    required this.date,
    required this.img,
    required this.price,
    required this.quantity,
    required this.duration,
  });
}

// Booking Provider
class CancelconfirmationProvider with ChangeNotifier {
  // List of bookings
  final List<Booking> _bookings = [
    Booking(
      title: 'Hot Stone Massage',
      description: 'Deep Muscle Relaxation | Stress & Anxiety Relief',
      date: '10 Aug',
      img: 'assets/orders/first.png', // Replace with your local asset path
      price: 2000,
      quantity: 1,
      duration: 60,
    ),
    Booking(
      title: 'Anti Stress Massage',
      description: 'Instant Relaxation | Calm Your Mind',
      date: '10 Aug',
      img: 'assets/orders/second.png', // Replace with your local asset path
      price: 2000,
      quantity: 1,
      duration: 60,
    ),
    // Add more bookings here if needed
  ];

  List<Booking> get bookings => _bookings;

  void cancelAllBookings() {
    _bookings.clear();
    notifyListeners();
  }
}
