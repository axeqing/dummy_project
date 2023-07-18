import 'package:dummy_project/responsive.dart';
import 'package:dummy_project/transaction/component/transaction.dart';
import 'package:dummy_project/transaction/component/transactionTablet.dart';
import 'package:flutter/material.dart';

class transactionScreen extends StatelessWidget {
  const transactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: transaction(),
        tablet: transactionTalet(),
      ),
    );
  }
}
