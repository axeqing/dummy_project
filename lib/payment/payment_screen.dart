import 'package:dummy_project/payment/component/payment.dart';
import 'package:dummy_project/payment/component/paymentTablet.dart';
import 'package:dummy_project/responsive.dart';
import 'package:flutter/material.dart';

class paymentScreen extends StatelessWidget {
  const paymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: Payment(),
        tablet: PaymentTablet(),
      ),
    );
  }
}