import 'package:flutter/material.dart';

@immutable
class Category {
  const Category({
    required this.title,
    required this.iconPath,
    required this.merchantsCount,
    required this.subCategories,
    required this.popularity,
  });

  final String title;
  final String iconPath;
  final int merchantsCount;
  final int popularity;
  final List subCategories;
}
