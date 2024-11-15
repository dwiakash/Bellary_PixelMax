import 'package:flutter/material.dart';

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem(
      {required this.question, required this.answer, this.isExpanded = false});
}

class FAQProvider with ChangeNotifier {
  final List<FAQItem> _faqItems = [
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),
    FAQItem(
        question: 'What payment methods are accepted on the app?',
        answer: 'We accept credit cards, debit cards, and PayPal.'),

    // Add more FAQItems as needed
  ];

  List<FAQItem> get faqItems => _faqItems;

  void toggleFAQItem(int index) {
    _faqItems[index].isExpanded = !_faqItems[index].isExpanded;
    notifyListeners();
  }
}
