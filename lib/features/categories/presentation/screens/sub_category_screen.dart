import 'package:flutter/material.dart';
import 'widgets/all_offers_text.dart';
import 'widgets/merchants_list.dart';
import 'widgets/sorting_selector.dart';
import 'widgets/sub_categories_list.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Food',
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
            Text(
              'Sub Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SubCategoriesList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllOffersText(),
                //! magnifier and sort text
                SortingSelector(),
              ],
            ),
            //! selector
            Expanded(
              child: MerchantsList(),
            ),
          ],
        ),
      ),
    );
  }
}
