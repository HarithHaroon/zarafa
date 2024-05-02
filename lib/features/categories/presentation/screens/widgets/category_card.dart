import 'package:flutter/material.dart';
import 'package:zarafa/features/categories/presentation/screens/sub_category_screen.dart';

import '../../../domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final containerWidth = size.width * 0.06;

    final imageWidth = size.width * 0.2;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const SubCategoryScreen();
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height * 0.2,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(size.width * 0.03),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  category.iconPath,
                  width: imageWidth,
                  height: imageWidth,
                ),
                Text(
                  category.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.23,
            top: size.height * 0.01,
            child: Container(
              width: containerWidth,
              height: containerWidth,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${category.popularity}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
