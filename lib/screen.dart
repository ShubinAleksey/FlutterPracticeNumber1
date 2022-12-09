import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
        Text(text)
      ),
    );
  }
}