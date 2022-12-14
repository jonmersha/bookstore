import 'package:bookstore/features/controllers/DocumentController.dart';
import 'package:bookstore/features/controllers/document_section_controller.dart';
import 'package:bookstore/features/model/document_model.dart';
import 'package:bookstore/features/model/document_section_model.dart';
import 'package:bookstore/features/presentation/page/documents/pdf_viwer.dart';
import 'package:bookstore/features/presentation/page/documents/share_doc.dart';
import 'package:bookstore/features/presentation/page/home/main_landing_page.dart';
import 'package:bookstore/features/presentation/widget/app_icon.dart';
import 'package:bookstore/features/utils/app_constants.dart';
import 'package:bookstore/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SectionPDFView extends StatelessWidget {
  final Section sectionModel;

  final DocumentSectionController documentSectionController;

  const SectionPDFView(
      {Key? key, required this.sectionModel, required this.documentSectionController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background Immage
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.blue),
              )
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const MainLandingPage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 800));
                    },
                    child: const AppIcon(
                      iconData: Icons.arrow_back,
                      iconSize: 30,
                      iconColor: Colors.blue,
                      backGroundColor: Colors.white,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => ShareDocument(),
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 800));
                      },
                      child: const AppIcon(
                          iconData: Icons.share_outlined,
                          iconSize: 30,
                          iconColor: Colors.blue,
                          backGroundColor: Colors.white)
                  )
                ],
              )),
          //Introduction of the food
          Positioned(left: 0,
              right: 0,
              bottom: 0,
              top: 90,
              child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.height20),
                        topRight: Radius.circular(Dimensions.height20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.white
                        ),
                        child:Text(sectionModel.sectionName!,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center
                        )
                    ),
                    Expanded(
                      child: PDF(AppConstants.DOC_URL+sectionModel.documentPath!),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              )),
          //expandable text widget
        ],
      ),

    );
  }
}
