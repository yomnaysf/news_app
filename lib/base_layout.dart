import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: const Color(0xffF8F8FA),
        centerTitle: true,
        title: const Text(
          'NEWS',
          style: TextStyle(
            color: Colors.red,
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: body,
    );
  }
}
