import 'package:flutter/material.dart';

class LeftImageSection extends StatelessWidget {
  final String imagePath;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  const LeftImageSection({
    Key? key,
    required this.imagePath,
    this.padding,
    this.backgroundColor = const Color.fromARGB(255, 234, 244, 251),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: backgroundColor,
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
