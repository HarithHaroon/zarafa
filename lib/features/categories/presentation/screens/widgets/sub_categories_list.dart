import 'package:flutter/material.dart';

import 'sub_category_card.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final listHeight = size.height * 0.2;

    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const SubCategoryCard();
        },
      ),
    );
  }
}
