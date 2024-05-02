import 'package:flutter_test/flutter_test.dart';
import 'package:zarafa/features/categories/domain/entities/category.dart';

void main() {
  test('creates a new Category instance with required parameters', () {
    const String title = 'Food';
    const String iconPath = 'assets/images/food.png';
    const int merchantsCount = 100;
    const int popularity = 5;
    final List subCategories = [];

    final category = Category(
      title: title,
      iconPath: iconPath,
      merchantsCount: merchantsCount,
      subCategories: subCategories,
      popularity: popularity,
    );

    expect(category.title, title);
    expect(category.iconPath, iconPath);
    expect(category.merchantsCount, merchantsCount);
    expect(category.popularity, popularity);
    expect(category.subCategories, subCategories);
  });
}
