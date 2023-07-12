import 'package:dummy_project/main/component/mainpage.dart';
import 'package:dummy_project/main/component/mainpageTablet.dart';
import 'package:dummy_project/responsive.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: Responsive(
        mobile: MainPageView2() ,
        tablet: MainPageViewTablet(),
      ),
      
    );
  }
}
