import 'package:dummy_project/detail/component/Details.dart';
import 'package:dummy_project/detail/component/DetailsTablet.dart';
import 'package:dummy_project/responsive.dart';
import 'package:flutter/material.dart';

class detailScreen extends StatelessWidget {
  const detailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: Details(),
        tablet: DetailsTablet(),
      ),
    );
  }
}
