import 'package:flutter/material.dart';

class SortingSelector extends StatelessWidget {
  const SortingSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final imageWidth = size.width * 0.1;

    final containerWidth = size.width * 0.1;

    return Row(
      children: [
        Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(size.width * 0.03),
            border: Border.all(color: Colors.purple, width: 2),
          ),
          child: Image.asset(
            'assets/icons/magnifier_purple.png',
            width: imageWidth,
            height: imageWidth,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: size.width * 0.2,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(size.width * 0.03),
            border: Border.all(color: Colors.purple, width: 2),
          ),
        ),
      ],
    );
  }
}
