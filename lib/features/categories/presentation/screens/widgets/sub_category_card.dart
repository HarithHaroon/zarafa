import 'package:flutter/material.dart';

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final imageWidth = size.width * 0.2;

    final cardWidth = size.width * 0.25;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Column(
            children: [
              Container(
                width: cardWidth,
                height: cardWidth,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                child: Image.asset(
                  'assets/images/burger.png',
                  width: imageWidth,
                  height: imageWidth,
                ),
              ),
              Text(
                'Burger',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
