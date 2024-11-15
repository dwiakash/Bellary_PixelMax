import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/cancel_confirma_provider.dart';

class BookingReschedule extends StatelessWidget {
  const BookingReschedule({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<CancelconfirmationProvider>(context).bookings;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Use ClipOval to make the container circular
                  ClipOval(
                    child: Container(
                      color: Colors.amber,
                      width: 100, // Width of the circular container
                      height: 100, // Height of the circular container
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 60, // Icon size
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Booking Reschdule !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'Dear User, you have successfully reschedule your booking of ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Hot Stone Massage & Anti Stress Massage',
                          style:
                              const TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        const TextSpan(
                          text:
                              ' for the upcoming date 10 Aug. We hope to serve you better',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        return _buildBookingItem(context, bookings[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          height: 50, // Fixed height for the button
          child: ElevatedButton(
            onPressed: () {
              context.push(Routes.cancelbooking);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Go Back',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingItem(BuildContext context, Booking booking) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                booking.img,
                height: 120, // Increased height
                width: 120, // Increased width
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
                width: 15), // Increased spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2, // Limit text to 2 lines
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis if text overflows
                  ),
                  const SizedBox(height: 4),
                  Text(
                    booking.description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 11,
                      ),
                      Text('60 Min'),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '₹${booking.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      // Added spacing to separate quantity text
                      Text(
                        'Quantity: ${booking.quantity}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15), // Increased spacing between bookings
      ],
    );
  }
}
