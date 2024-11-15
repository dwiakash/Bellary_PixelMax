import 'package:flutter/material.dart';

import '../../../constants/app_strings.dart';
import '../../../constants/size_unit.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

Widget buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Text(
      content,
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.black87,
      ),
    ),
  );
}

Widget aboutuscontent() {
  return Padding(
    padding: const EdgeInsets.all(SizeUnit.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle('Connecting You to Local Excellence'),
        buildSectionContent(
          'Welcome to ${AppStrings.appName}, your gateway to convenient shopping, reliable services, and local store experiences—all at your fingertips. Our app is designed to bring the best of your city to your doorstep, ensuring that your daily needs are met with ease and efficiency.',
        ),
        buildSectionTitle('Our Mission & Vision'),
        buildSectionContent(
          'At ${AppStrings.appName}, we envision a community where technology seamlessly connects customers with local businesses, enhancing both convenience and the local economy. Our goal is to make everyday shopping and service booking as simple and personalized as possible, all while supporting the businesses that make your city unique.',
        ),
        buildSectionTitle('Key Features'),
        buildSectionContent(
          '• Effortless Shopping: Browse and shop from a wide range of products, from groceries to electronics, all from the comfort of your home. Our intuitive interface makes it easy to find what you need and get it delivered quickly.\n\n'
          '• Trusted Local Services: Need a service? Whether it’s home cleaning, beauty treatments, appliance repairs, or more, ${AppStrings.appName} connects you with trusted local professionals who are ready to help. Book services with confidence, knowing that quality and reliability are our top priorities.\n\n'
          '• Support Your Local Shops: Discover and shop from local stores in your area. ${AppStrings.appName} makes it easy to find and purchase products from your favorite neighborhood shops, helping to keep your community vibrant and thriving.',
        ),
        buildSectionTitle('Why Choose ${AppStrings.appName} Seller?'),
        buildSectionContent(
          '• Convenience at its Best: ${AppStrings.appName} is your one-stop solution for shopping and services. Everything you need is just a few taps away, whether you’re ordering groceries or booking a service.\n\n'
          '• Personalized Experience: Our app tailors your experience based on your preferences, ensuring that you see the products and services that matter most to you.\n\n'
          '• Community-Centered: We believe in the power of local. By choosing ${AppStrings.appName}, you’re not just getting what you need—you’re also supporting the businesses that make your community special.',
        ),
        buildSectionTitle('Join the ${AppStrings.appName} Community'),
        buildSectionContent(
          'With ${AppStrings.appName}, shopping and service booking have never been easier or more local. Start discovering and connecting with your local stores or service providers today. Join us in building a better city, a better community, and a connection to the best the city has to offer.',
        ),
      ],
    ),
  );
}
