import 'package:flutter/material.dart';

import 'widgets/categories_grid.dart';
import 'widgets/popular_categories.dart';

import 'widgets/search_categories.dart';
import 'widgets/categories_title.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchCategories(),
              SizedBox(height: 30),
              CategoriesTitle(
                title: 'Popular Categories',
              ),
              SizedBox(height: 30),
              PopularCategories(),
              CategoriesTitle(
                title: 'All Categories',
              ),
              Expanded(
                child: CategoriesGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
