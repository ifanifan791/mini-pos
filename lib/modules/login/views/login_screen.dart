import 'package:flutter/material.dart';
import '../../../core/responsive_layout.dart';
import 'mobile/login_mobile.dart';
import 'tablet/login_tablet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: LoginMobile(),
        tabletBody: LoginTablet(),
      ),
    );
  }
}