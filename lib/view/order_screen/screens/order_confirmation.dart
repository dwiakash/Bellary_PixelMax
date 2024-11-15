//line 74 goto he cancelBooking
//

import 'dart:ffi';

import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/services/route/router.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/view/order_screen/widget/ScheduleTimeModal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/orders_provider.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDetails =
        Provider.of<OrderConfirmationProvider>(context).orderDetails;
    final screenWidth = MediaQuery.of(context).size.width;

    // Function to show calendar modal
    void _showCalendarModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: ScheduleTimeModal(),
          );
        },
      );
    }

    // Function to show confirmation dialog
    void _showConfirmationDialog(String action) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            contentPadding: EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '😞',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure about cancelling this booking?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You can always reschedule it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          (screenWidth - 128) / 2, // Adjust width for padding
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => context.push(Routes.cancelbooking),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text("Cancel anyway"),
                      ),
                    ),
                    SizedBox(
                      width:
                          (screenWidth - 128) / 2, // Adjust width for padding
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _showCalendarModal(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text("Reschedule"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              "Order Details",
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            Icon(
              Icons.shopping_cart_outlined, // Use outlined version
              color: Colors.black, // White border with no fill
            ),
            SizedBox(width: 16), // Add spacing between icons
            Icon(
              Icons.notifications_outlined, // Use outlined version
              color: Colors.black, // White border with no fill
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ID ${orderDetails.orderId}",
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  // Date and Category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${orderDetails.date}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${orderDetails.category}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(
                                orderDetails.location,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Service List
                  ...orderDetails.services.map(
                    (service) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.3, // Responsive width
                            height: screenWidth * 0.3, // Responsive height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(service.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 16), // Space between image and text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  service.description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('60 min'),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "₹${service.price.toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text('Quatity ${service.quantity}')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Billing Details
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Billing Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Item Total"),
                            Text("₹${orderDetails.itemTotal.toString()}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Item Discount"),
                            Text("-₹${orderDetails.itemDiscount.toString()}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Service Fee"),
                            Text("₹${orderDetails.serviceFee.toString()}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "Grand Total",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "₹${orderDetails.grandTotal.toString()}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Payment Mode
                  Container(
                    color: Colors.blue[50],
                  
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Payment Mode",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            orderDetails.paymentMode,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Address and Schedule
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.home_outlined),
                            const Text(
                              "Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(orderDetails.address),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.alarm),
                            SizedBox(
                              width: 10,
                            ),
                            Text(orderDetails.scheduleDate),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Ph: ${orderDetails.phoneNumber}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (screenWidth - 48) / 2,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog("Cancel");
                    },
                    child: const Text("Cancel"),
                  ),
                ),
                SizedBox(
                  width: (screenWidth - 48) / 2,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _showCalendarModal(context);
                    },
                    child: const Text("Reschedule"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for the Schedule Time Modal
