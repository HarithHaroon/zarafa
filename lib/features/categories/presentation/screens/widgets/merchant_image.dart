import 'package:flutter/material.dart';

class MerchantImage extends StatelessWidget {
  const MerchantImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final cardWidth = size.width * 0.2;

    final imageWidth = size.width * 0.3;

    return Container(
      width: cardWidth,
      height: cardWidth,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.03),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Image.asset(
        'assets/images/food_circle.png',
        width: imageWidth,
        height: imageWidth,
      ),
    );
  }
}
