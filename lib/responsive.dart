import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const Responsive({super.key, required this.mobile, required this.tablet});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context,constraints) {
  //       if (constraints.maxWidth >= 650) {
  //         return tablet;
  //       } else if (constraints.maxWidth < 650) {
  //         return mobile;
  //       }
  //     },
  //   );
  // }
    Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          print(MediaQuery.of(context).size.width);
          return tablet;
          }
        // Or less then that we called it mobile
        else {
          print(MediaQuery.of(context).size.width);
          return mobile;
        }
      },
    );
  }
}
