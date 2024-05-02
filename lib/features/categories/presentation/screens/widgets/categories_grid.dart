import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/categories_notifier_provider.dart';
import 'category_card.dart';
import 'loading_indicator.dart';
import 'try_again.dart';

class CategoriesGrid extends ConsumerWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesNotifierProvider);

    return categories.when(
      data: (data) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.5,
            mainAxisSpacing: 10,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final category = data[index];

            return CategoryCard(category: category);
          },
        );
      },
      error: (error, stackTrace) {
        return TryAgain(
          onTap: () => ref.invalidate(categoriesNotifierProvider),
        );
      },
      loading: () {
        return const LoadingIndicator();
      },
    );
  }
}
