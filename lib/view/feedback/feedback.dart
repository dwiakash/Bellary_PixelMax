import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/feedback_provider.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color to white
        title: Text(
          'Feedback',
          style: TextStyle(color: Colors.black), // Set the text color to black
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back icon color
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        elevation: 1.0, // Add a slight elevation for the app bar shadow
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ServiceCard(
                      title: 'Hot Stone Massage',
                      description:
                          'Deep Muscle Relaxation | Stress & Anxiety Relief',
                      duration: '60 min',
                      price: '₹2000',
                      quantity: 1,
                    ),
                    ServiceCard(
                      title: 'Anti Stress Massage',
                      description: 'Instant Relaxation | Calm Your Mind',
                      duration: '60 min',
                      price: '₹2000',
                      quantity: 1,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'How would you rate the experience and service?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    RatingStars(),
                    CommentBox(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2, left: 14.0, right: 14.0),
            child: SubmitFeedbackButton(),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String price;
  final int quantity;

  const ServiceCard({
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/orders/first.png', // Placeholder image
                  fit: BoxFit.cover,
                  height: 100, // Set a height to match the card content
                ),
              ),
            ),
            SizedBox(width: 16), // Add space between image and text content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text('$description\n$duration'),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Quantity: $quantity'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rating = context.watch<FeedbackProvider>().rating;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            context.read<FeedbackProvider>().setRating(index + 1);
          },
        );
      }),
    );
  }
}

class CommentBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String comment = context.watch<FeedbackProvider>().comment;

    return TextField(
      decoration: InputDecoration(
        hintText: 'Describe your experience / comment',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(12),
      ),
      maxLines: 4,
      onChanged: (text) {
        context.read<FeedbackProvider>().setComment(text);
      },
    );
  }
}

class SubmitFeedbackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // context.push(Routes.feedbackSubmissions);
          int rating = context.read<FeedbackProvider>().rating;
          String comment = context.read<FeedbackProvider>().comment;
          // Handle feedback submission
          print('Rating: $rating, Comment: $comment');
        },
        child: Text('Submit Feedback'),
      ),
    );
  }
}
