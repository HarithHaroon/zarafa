import 'package:flutter/material.dart';
import 'package:zarafa/features/categories/presentation/screens/widgets/merchant_image.dart';

class MerchantsList extends StatelessWidget {
  const MerchantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) {
        return Row(
          children: [
            const MerchantImage(),
            SizedBox(width: size.width * 0.03),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FreshDirect',
                  style: TextStyle(fontSize: size.width * 0.05),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //! todo: change this icon
                    const Icon(
                      Icons.add_circle,
                    ),
                    SizedBox(width: size.width * 0.02),
                    const Text(
                      'up to 10% online',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
