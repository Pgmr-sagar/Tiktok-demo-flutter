import 'package:flutter/material.dart';

class BottomBarDemoPage extends StatelessWidget {
  const BottomBarDemoPage({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        icon,
        color: Colors.white,
        size: 150,
      ),
    );
  }
}
