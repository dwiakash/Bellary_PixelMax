import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/services/route/router.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/order_pages_provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orders = orderProvider.orders;

    return CustomScaffold(
      appBar: const AppBarCommon(
        backgroundColor: Palette.pureWhite,
        title: 'Your Orders & Bookings',
        hadNotifications: true,
        hadCart: true,
        automaticLeadingImplies: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: Palette.dark,
                      unselectedLabelColor: Palette.grey, // Inactive tab color
                      tabs: [
                        Tab(text: 'Current'),
                        Tab(text: 'Previous'),
                        Tab(text: 'Cancelled'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Current Orders Tab
                          _buildOrderList(orders, context),
                          // Previous Orders Tab (Similar layout)
                          _buildOrderList(orders, context),
                          // Cancelled Orders Tab (Similar layout)
                          _buildOrderList(orders, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List<Order> orders, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: orders.map((order) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width:
                        120, // Adjust width to fit nicely with the description
                    height: 150, // Adjust height to span description to price
                    child: Image.asset(
                      order.img,
                      fit: BoxFit.cover, // Fill image to fit the box
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Space between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        order.title,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 4),
                      TextCustom(
                        order.description,
                        color: Palette.dark,
                        size: 12, // Slightly larger description size
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '60 min',
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(
                            '₹${order.price}',
                            size: 14, // Larger size for price
                            fontWeight: FontWeight.bold,
                          ),
                          TextCustom(
                            'Quantity: ${order.quantity}',
                            size: 12,
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to order confirmation page
                              context.push(Routes.orderconfirmation);
                            },
                            child: const Text(
                              'View Details',
                              style: TextStyle(
                                color: Palette.primary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
