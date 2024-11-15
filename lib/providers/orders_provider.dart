import 'package:flutter/material.dart';

class OrderDetails {
  final String orderId;
  final String date;
  final String category;
  final String location;
  final List<ServiceItem> services;
  final double itemTotal;
  final double itemDiscount;
  final double serviceFee;
  final double grandTotal;
  final String paymentMode;
  final String address;
  final String scheduleDate;
  final String phoneNumber;
  // final int quatity;


  OrderDetails({
    required this.orderId,
    required this.date,
    required this.category,
    required this.location,
    required this.services,
    required this.itemTotal,
    required this.itemDiscount,
    required this.serviceFee,
    required this.grandTotal,
    required this.paymentMode,
    required this.address,
    required this.scheduleDate,
    required this.phoneNumber,
    
  });
}

class ServiceItem {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int quantity;

  ServiceItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,

  });
}

class OrderConfirmationProvider with ChangeNotifier {
  final OrderDetails _orderDetails = OrderDetails(
    orderId: "#0001",
    date: "10nd \n Aug, Friday",
    category: "Massages & Spa",
    location: "Electronic City",
    services: [
      ServiceItem(
        name: "Hot Stone Massage",
        description: "Deep Muscle Relaxation\n | Stress & Anxiety Relief",
        imageUrl: "assets/orders/first.png",
        price: 2000.0,
        quantity: 1,
      ),
      ServiceItem(
        name: "Anti Stress Massage",
        description: "Instant Relaxation\n | Calm Your Mind",
        imageUrl: "assets/orders/second.png",
        price: 2000.0,
        quantity: 1,
      ),
    ],
    itemTotal: 699.0,
    itemDiscount: 50.0,
    serviceFee: 50.0,
    grandTotal: 749.0,
    paymentMode: "Paytm UPI",
    address: "Plot no.209, Electronic City, Ballari, Karnataka 500033",
    scheduleDate: "Friday, Aug 09 - 10:45 AM",
    phoneNumber: "+91234567890",
  );

  OrderDetails get orderDetails => _orderDetails;
}
