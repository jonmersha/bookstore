
import 'package:bookstore/features/presentation/page/service/component/BankServiceList.dart';
import 'package:bookstore/features/presentation/page/documents/DocumentSlider.dart';
import 'package:bookstore/features/presentation/page/service/component/service_card.dart';
import 'package:bookstore/features/presentation/widget/BigText.dart';
import 'package:bookstore/features/presentation/widget/SmalText.dart';
import 'package:bookstore/features/utils/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/BranchServiceController.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../main_service_list_container.dart';

class BankServiceBody extends StatefulWidget {
  const BankServiceBody({Key? key}) : super(key: key);
  @override
  State<BankServiceBody> createState() => _BankServiceBodyState();
}

class _BankServiceBodyState extends State<BankServiceBody> {
  @override
  // Widget build(BuildContext context) {
  //   return ServiceList();
  // }
  Widget build(BuildContext context) {
    return         GetBuilder<BranchServiceController>(builder: (serviceController){
      return serviceController.isLoaded?
      Column(
        children: [
          DocumentSlider(),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: serviceController.serviceList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(()=>DetailServiceListContainer(serviceModel: serviceController.serviceList[index]),
                        transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 800));
                  },

                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: Row(
                      children: [
                        Container(
                          margin:  const EdgeInsets.only(bottom: 7),
                          height: Dimensions.listViewIMG,
                          width: Dimensions.listViewIMG,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(Dimensions.width10),
                              color: Colors.amber,
                              image:  DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.IMAGE_URL+serviceController.serviceList[index].serviceIconPath!)
                              )),
                        ),
                        Expanded(
                          child: Container(
                            //height: Dimensions.listViewTextView,
                            width: Dimensions.listViewTextView,
                            margin: const EdgeInsets.only(bottom: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.width10),
                                    bottomRight:
                                    Radius.circular(Dimensions.width10)),
                                color: Colors.white30),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10),
                              child: ServiceCard(service:serviceController.serviceList[index]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ):CircularProgressIndicator(
        color: AppColors.mainColor,
      );
    });
  }

}

//1.23.58 Stoped Here
//1.56.48 Stoped here
