import 'package:ecommerce_app/pages/succespayment.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Method
            Text(
              'Payment Method',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildPaymentMethod(),

            // Billing Address
            const SizedBox(height: 16.0),
            Text(
              'Billing Address',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildBillingAddress(),

            // Total Amount
            const SizedBox(height: 16.0),
            Text(
              'Total Amount',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _buildTotalAmount('\$2,099.97'),

            // Confirm Button
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the SuccessPayment screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessPayment()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                ),
                child: const Text(
                  'Confirm Payment',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Credit Card'),
            subtitle: const Text('**** **** **** 1234'),
            trailing: const Icon(Icons.edit),
            onTap: () {
              // Handle payment method change
            },
          ),
          ListTile(
            leading: const Icon(Icons.paypal),
            title: const Text('PayPal'),
            trailing: const Icon(Icons.edit),
            onTap: () {
              // Handle PayPal payment method
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBillingAddress() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressField('Name', 'John Doe'),
            _buildAddressField('Address', '123 Main Street'),
            _buildAddressField('City', 'City'),
            _buildAddressField('Country', 'Country'),
            _buildAddressField('Postal Code', '12345'),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(String amount) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          amount,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
