import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar > 800px (cocok untuk iPad Pro Horizontal)
        if (constraints.maxWidth > 800) {
          return tabletBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}