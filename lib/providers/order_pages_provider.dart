import 'package:flutter/material.dart';

class Order {
  final String title;
  final String description;
  // final String status;
  final String img;
  final int price;
  final int quantity;
  final int duration; // in minutes, if applicable

  Order({
    required this.title,
    required this.description,
    // required this.status,
    required this.img,
    required this.price,
    required this.quantity,
    this.duration = 0,
  });
}

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [
    Order(
      title: 'Hot Stone Massage',
      description: 'Deep Muscle Relaxation | Stress & Anxiety Relief',
      // status: 'Booked',
      img: 'assets/orders/first.png', // example asset path
      price: 2000,
      quantity: 1,
      duration: 60,
    ),
    Order(
      title: 'Leather Crossbody Bag',
      description: 'Deep Muscle Relaxation | Stress & Anxiety Relief',
      // status: 'Out for Delivery',
      img: 'assets/orders/second.png', // example asset path
      price: 2000,
      quantity: 1,
    ),
  ];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}
