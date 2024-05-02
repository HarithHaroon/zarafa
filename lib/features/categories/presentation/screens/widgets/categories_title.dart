import 'package:flutter/material.dart';

class CategoriesTitle extends StatelessWidget {
  const CategoriesTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.width * 0.05,
      ),
    );
  }
}
