import 'package:bookstore/features/model/document_model.dart';
import 'package:bookstore/features/presentation/widget/BigText.dart';
import 'package:bookstore/features/presentation/widget/SmalText.dart';
import 'package:bookstore/features/presentation/widget/text_with_icon.dart';
import 'package:bookstore/features/utils/app_colors.dart';
import 'package:bookstore/features/utils/dimensions.dart';

import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final Document product;
  const CardList({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: product.documentName!,

          size: Dimensions.fontSize20,
          color: AppColors.mainColor,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(
          text: product.documentDescription!,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            TextWithIcon(
              text: "Time ",
              icon: Icons.circle,
              iconColor: Colors.yellow,
              iconSize: Dimensions.icon26,
              textSize: Dimensions.fontSize12,
              textColor: AppColors.textColor,
            ),
            TextWithIcon(
              text: "Location",
              icon: Icons.location_on,
              iconColor: Colors.green,
              textColor: AppColors.textColor,
              iconSize: Dimensions.icon26 - 3,
              textSize: Dimensions.fontSize12,
            ),
            TextWithIcon(
              text: "",
              icon: Icons.timelapse,
              iconColor: Colors.green,
              textColor: AppColors.textColor,
              iconSize: Dimensions.icon26 - 3,
              textSize: Dimensions.fontSize12,
            ),
          ],
        )
      ],
    );
  }
}
