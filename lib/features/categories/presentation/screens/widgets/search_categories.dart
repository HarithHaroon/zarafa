import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zarafa/features/categories/application/providers/categories_notifier_provider.dart';

class SearchCategories extends ConsumerWidget {
  const SearchCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints);
        return SizedBox(
          height: size.height * 0.07,
          child: TextField(
            onChanged: (value) async {
              final notifier = ref.read(categoriesNotifierProvider.notifier);

              await notifier.searchCategories(value);
            },
            decoration: InputDecoration(
              hintText: 'Search categories',
              prefixIcon: Image.asset('assets/icons/magnifier.png'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
