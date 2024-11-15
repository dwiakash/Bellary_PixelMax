import 'package:bellaryapp/providers/sellerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
            
              return _buildWideForm(context);
            } else {

              return _buildNarrowForm(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildNarrowForm(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          context,
          label: 'Seller Name',
          onChanged: (value) => context.read<SellerProvider>().updateName(value),
        ),
        _buildTextField(
          context,
          label: 'Business Name',
          onChanged: (value) => context.read<SellerProvider>().updateBusinessName(value),
        ),
        _buildTextField(
          context,
          label: 'Email',
          onChanged: (value) => context.read<SellerProvider>().updateEmail(value),
        ),
        _buildTextField(
          context,
          label: 'Phone',
          onChanged: (value) => context.read<SellerProvider>().updatePhone(value),
        ),
        _buildTextField(
          context,
          label: 'Address',
          onChanged: (value) => context.read<SellerProvider>().updateAddress(value),
        ),
        SizedBox(height: 20),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildWideForm(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTextField(
                context,
                label: 'Seller Name',
                onChanged: (value) => context.read<SellerProvider>().updateName(value),
              ),
              _buildTextField(
                context,
                label: 'Business Name',
                onChanged: (value) => context.read<SellerProvider>().updateBusinessName(value),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              _buildTextField(
                context,
                label: 'Email',
                onChanged: (value) => context.read<SellerProvider>().updateEmail(value),
              ),
              _buildTextField(
                context,
                label: 'Phone',
                onChanged: (value) => context.read<SellerProvider>().updatePhone(value),
              ),
              _buildTextField(
                context,
                label: 'Address',
                onChanged: (value) => context.read<SellerProvider>().updateAddress(value),
              ),
            ],
          ),
        ),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildTextField(BuildContext context, {required String label, required Function(String) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(labelText: label),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (context.read<SellerProvider>().validateFields()) {
          // Handle form submission
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form submitted!')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
        }
      },
      child: Text('Submit'),
    );
  }
}
