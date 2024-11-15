import 'package:bellaryapp/providers/view_ProductProvider.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ViewProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewProductProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                'Product Details',
                style: TextStyle(color: Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.trolley,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Consumer<ViewProductProvider>(
          builder: (context, provider, child) {
            final product = provider.product;

            return Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),

                              // Image Slider
                              Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: PageView.builder(
                                    itemCount: product
                                        .images.length, // Number of images
                                    onPageChanged: (index) {
                                      provider.updateImageIndex(
                                          index); // Update index
                                    },
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                        product.images[index],
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // Dot Indicators
                              SizedBox(height: 8),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(product.images.length,
                                      (index) {
                                    return AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      width: 8.0,
                                      height: 8.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            index == provider.currentImageIndex
                                                ? Colors.blue
                                                : Colors.grey,
                                      ),
                                    );
                                  }),
                                ),
                              ),

                              SizedBox(height: 13),

                              // Product Name
                              Row(
                                children: [
                                  Text(
                                    product.name ?? 'Unknown Product',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    '₹${product.price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.green),
                                  ),
                                ],
                              ),

                              SizedBox(height: 7),

                              // Product Description
                              Text(
                                product.description ?? '',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),

                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Text(
                                    '20% Offers Available',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your onPressed functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 35),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                    child: Text('Added'),
                                  )
                                ],
                              ),

                              Text(
                                'Estimated Delivery Time : 27/08/2024',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),

                              Container(
                                color: Colors.grey.shade400,
                                width: MediaQuery.of(context).size.width,
                                height: 3,
                              ),

                              SizedBox(height: 15),

                              // Color Selection
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                      "Select your Preferred Color/Model",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  // GridView for Colors/Models
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.75,
                                    ),
                                    itemCount: product.availableColors.length,
                                    itemBuilder: (context, index) {
                                      final color =
                                          product.availableColors[index];

                                      return GestureDetector(
                                        onTap: () =>
                                            provider.selectColor(color),
                                        child: Card(
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: Colors.grey[300],
                                                  width: double.infinity,
                                                  child: Center(
                                                    child: Text(
                                                      color,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8.0),
                                                width: double.infinity,
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    if (provider
                                                            .selectedColor ==
                                                        color)
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            provider
                                                                .selectColor(
                                                                    color),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons.check,
                                                                size: 16),
                                                            SizedBox(width: 4),
                                                            Text('Selected'),
                                                          ],
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.blue,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      )
                                                    else
                                                      OutlinedButton(
                                                        onPressed: () =>
                                                            provider
                                                                .selectColor(
                                                                    color),
                                                        child: Text('Select'),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          side: BorderSide(
                                                              color:
                                                                  Colors.black),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      12.0,
                                                                  vertical:
                                                                      8.0),
                                                          textStyle: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 24.0),
                                  Text(
                                    "Service Details :",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "• 60 min\n"
                                    "• For all skin types.\n"
                                    "• 6-step process. Includes 10-min massage",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "Experience the ultimate relaxation with our Hot Stone Massage, "
                                    "a therapeutic treatment that combines the healing power of heat "
                                    "with expert massage techniques.",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Related Services:',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'View all',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: product.services.length,
                                        itemBuilder: (context, index) {
                                          final service =
                                              product.services[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16.0),
                                            child: Container(
                                              width: 160,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Top part with image
                                                  Flexible(
                                                    flex: 2,
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  // Middle part with product details
                                                  Flexible(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            product.name,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                          SizedBox(height: 4.0),
                                                          Text(
                                                            product.description,
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey[600],
                                                              fontSize: 14.0,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  // Bottom part with price
                                                  Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(12),
                                                        bottomRight:
                                                            Radius.circular(12),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      '₹${product.price}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                ],
                              ),
                            ],
                          )))),
            ]);
          },
        ),

        // Price Section + Add to Cart Button
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Items Added',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '₹4000', // Update with dynamic price if needed
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Elevated Button
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                    context.push(Routes.cartScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Colors.blue, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
