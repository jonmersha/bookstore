import 'package:bookstore/features/controllers/BranchServiceController.dart';
import 'package:bookstore/features/presentation/page/book/component/service_card.dart';
import 'package:bookstore/features/presentation/page/book/book_list_container.dart';
import 'package:bookstore/features/utils/app_constants.dart';
import 'package:bookstore/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCatList extends StatelessWidget {
  final BranchServiceController serviceController;
  const BookCatList( {
    Key? key, required this.serviceController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:serviceController.serviceList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.to(()=>BookListContainer(serviceModel: serviceController.serviceList[index]),
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
        });
  }
}