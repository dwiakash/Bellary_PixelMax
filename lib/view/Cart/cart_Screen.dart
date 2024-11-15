import 'package:bellaryapp/providers/view_ProductProvider.dart';
import 'package:bellaryapp/services/route/router.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ViewProductProvider>(context);
    final product = productProvider.product;

    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background to white
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Implement back button functionality
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // Set AppBar background to white
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product item
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white, // Container background color white
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align at the top
                        children: [
                          // Product Image
                          Container(
                            width: 120,
                            height: 125,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/purse.png'),
                                fit: BoxFit
                                    .contain, // Ensure the image covers the entire box
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          // Product details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1, // Limit to one line
                                  overflow: TextOverflow.ellipsis,
                                  // Add ellipsis if text is too long
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Deep Muscle Relaxation | Stress & Anxiety Relief',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2, // Limit to two lines
                                  overflow: TextOverflow.ellipsis,
                                  // Add ellipsis if text is too long
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '₹${product.price}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                // Remove button
                                TextButton(
                                  onPressed: () {
                                    // Remove logic here
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          // Decrease quantity logic
                                        },
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        '1', // Hardcoded quantity for now
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add_circle_outline),
                                        onPressed: () {
                                          // Increase quantity logic
                                        },
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Checkout button fixed at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(Routes.addressScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
