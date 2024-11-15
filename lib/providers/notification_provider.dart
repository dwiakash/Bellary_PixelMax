import 'package:flutter/material.dart';

class NotificationItem {
  final String shopName;
  final String message;

  NotificationItem({required this.shopName, required this.message});
}

class NotificationProvider with ChangeNotifier {
  List<NotificationItem> _notifications = [
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
    NotificationItem(
      shopName: "Shop Name",
      message: "Your request to view products has been approved.",
    ),
  ];

  List<NotificationItem> get notifications => _notifications;

  void addNotification(NotificationItem notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void removeNotification(NotificationItem notification) {
    _notifications.remove(notification);
    notifyListeners();
  }
}
