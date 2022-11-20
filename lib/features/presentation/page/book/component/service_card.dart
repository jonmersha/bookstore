
import 'package:bookstore/features/model/service_model.dart';
import 'package:bookstore/features/presentation/widget/BigText.dart';
import 'package:bookstore/features/presentation/widget/SmalText.dart';

import 'package:bookstore/features/utils/app_colors.dart';
import 'package:bookstore/features/utils/dimensions.dart';

import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  const ServiceCard({
    Key? key, required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: service.serviceName!,
          size: Dimensions.fontSize20,
          color: AppColors.mainColor,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(
          text: service.serviceDescription!,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
        )
      ],
    );
  }
}
