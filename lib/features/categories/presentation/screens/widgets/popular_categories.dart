import 'package:flutter/material.dart';
import '../../../application/providers/popular_categories_provider.dart';
import 'category_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loading_indicator.dart';
import 'try_again.dart';

class PopularCategories extends ConsumerWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;

    final listHeight = height < 800 ? height * 0.16 : height * 0.22;

    final categories = ref.watch(popularCategoriesProvider);

    return SizedBox(
      height: listHeight,
      child: categories.when(
        data: (data) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final category = data[index];

              return CategoryCard(category: category);
            },
          );
        },
        error: (error, stackTrace) {
          return TryAgain(
            onTap: () => ref.invalidate(popularCategoriesProvider),
          );
        },
        loading: () {
          return const LoadingIndicator();
        },
      ),
    );
  }
}
