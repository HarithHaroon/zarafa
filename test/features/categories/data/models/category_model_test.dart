import 'package:flutter_test/flutter_test.dart';
import 'package:zarafa/features/categories/data/models/category_model.dart';

void main() {
  group('CategoryModel.fromJson', () {
    test('creates a CategoryModel from a valid JSON map', () {
      final json = {
        'title': 'Food',
        'icon_path': 'assets/icons/food.png',
        'merchants_count': 100,
        'popularity': 80,
        'sub_categories': [],
      };

      final category = CategoryModel.fromJson(json);

      expect(category.title, 'Food');
      expect(category.iconPath, 'assets/icons/food.png');
      expect(category.merchantsCount, 100);
      expect(category.popularity, 80);
      expect(category.subCategories, isEmpty);
    });

    test('should return default values for null properties', () {
      final json = {
        'title': null,
        'icon_path': null,
        'merchants_count': null,
        'popularity': null,
        'sub_categories': null,
      };

      final category = CategoryModel.fromJson(json);

      expect(category.title, '');
      expect(category.iconPath, '');
      expect(category.merchantsCount, 0);
      expect(category.popularity, 0);
      expect(category.subCategories, []);
    });
  });
}
