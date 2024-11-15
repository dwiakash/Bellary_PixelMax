//line 95 goto cancel confirmation

import 'package:bellaryapp/common/dialogs/alert_dialog_custom.dart';
import 'package:bellaryapp/providers/cancel_booking_provider.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CancelBookingPage extends StatefulWidget {
  const CancelBookingPage({super.key});

  @override
  State<CancelBookingPage> createState() => _CancelBookingPageState();
}

class _CancelBookingPageState extends State<CancelBookingPage> {
  @override
  Widget build(BuildContext context) {
    final cancelBookingProvider = Provider.of<CancelBookingProvider>(context);

    // Get the screen size for responsive design
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cancel Booking',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildBookingItem(
                    'Hot Stone Massage',
                    'Deep Muscle Relaxation | Stress & Anxiety Relief',
                    '₹2000',
                    '60 min',
                    '1',
                  ),
                  _buildBookingItem(
                    'Anti Stress Massage',
                    'Instant Relaxation | Calm Your Mind',
                    '₹2000',
                    '60 min',
                    '1',
                  ),
                  const Divider(),
                  const Text('Reason For Cancellation'),
                  _buildCancellationReason(
                    cancelBookingProvider,
                    'Reason Here For Cancellation Of Booking',
                  ),
                  _buildCancellationReason(
                    cancelBookingProvider,
                    'Another Reason For Cancellation Of Booking',
                  ),
                  _buildCancellationReason(
                    cancelBookingProvider,
                    'Different Reason For Cancellation Of Booking',
                  ),
                  _buildCancellationReason(
                    cancelBookingProvider,
                    'Additional Reason For Cancellation Of Booking',
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    color: Colors.grey[200], // Grey background color
                    padding:
                        const EdgeInsets.all(12.0), // Padding inside the box
                    child: TextField(
                      onChanged: cancelBookingProvider.setComment,
                      decoration: const InputDecoration(
                        hintText: 'Describe a problem / comment',
                        border: InputBorder.none, // Remove border
                      ),
                      style: const TextStyle(fontSize: 12.0), // Text size 12
                      maxLines: null, // Allows the field to grow in height
                      minLines: 5, // Minimum lines to show
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context.push(Routes.cancelconfirmation);
                // Implement your cancellation logic here
                print(
                    'Selected Reason: ${cancelBookingProvider.selectedReason}');
                print('Comment: ${cancelBookingProvider.comment}');
              },
              child: const Text('Cancel Booking'),
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(screenSize.width * 0.9, 50), // Responsive button width
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingItem(
    String title,
    String subtitle,
    String price,
    String duration,
    String quantity,
  ) {
    return Card(
      elevation: 4.0, // Add slight shadow for better look
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners for card
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Padding inside the card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Rounded image corners
              child: SizedBox(
                width: 140, // Width of the image
                height: 160, // Height of the image for emphasis
                child: Image.asset(
                  'assets/orders/first.png',
                  fit: BoxFit.cover, // Ensure the image fills the space nicely
                ),
              ),
            ),
            const SizedBox(width: 12.0), // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize:
                          16.0, // Increase font size for better readability
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                      height: 6.0), // Space between title and subtitle
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey, // Subtle color for the subtitle
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0), // Space before duration row
                  Row(
                    children: [
                      const Icon(
                        Icons.alarm,
                        size: 17,
                        color: Colors.blueAccent, // Color for better visibility
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0), // Space before price row
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87, // Darker text for price
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Quantity: $quantity',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey, // Subtle color for quantity
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancellationReason(
      CancelBookingProvider cancelBookingProvider, String reason) {
    return RadioListTile(
      title: Text(reason),
      value: reason,
      groupValue: cancelBookingProvider.selectedReason,
      onChanged: (String? value) {
        cancelBookingProvider.setSelectedReason(value);
      },
    );
  }
}
