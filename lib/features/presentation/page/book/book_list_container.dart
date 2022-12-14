import 'package:bookstore/features/controllers/BranchServiceController.dart';
import 'package:bookstore/features/controllers/service_detail_list_controller.dart';
import 'package:bookstore/features/model/service_model.dart';
import 'package:bookstore/features/presentation/page/book/component/BankServiceList.dart';
import 'package:bookstore/features/presentation/page/book/book_list.dart';
import 'package:bookstore/features/presentation/widget/BigText.dart';
import 'package:bookstore/features/presentation/widget/app_icon.dart';
import 'package:bookstore/features/presentation/widget/expandable_text.dart';
import 'package:bookstore/features/utils/app_colors.dart';
import 'package:bookstore/features/utils/app_constants.dart';
import 'package:bookstore/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/main_landing_page.dart';

class BookListContainer extends StatelessWidget {
  final Service serviceModel;
  //final ServiceListDetailController detailedServiceController;
  BookListContainer({Key? key, required this.serviceModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=>MainLandingPage(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 800));
                      },
                      child: AppIcon(iconData: Icons.arrow_back,backGroundColor: Colors.white,)
                  ),
                  AppIcon(iconData: Icons.shopping_cart_outlined,),
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child:Container(
                  width: double.maxFinite,
                  height: 50,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)
                      ),
                      color: Colors.white
                  ),

                  child:  BigText(text: serviceModel.serviceName!,size: Dimensions.fontSize26, ),
                )
            ),
            pinned: true,
            backgroundColor: Colors.amber,
            expandedHeight: Dimensions.height200,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.IMAGE_URL+serviceModel.serviceIconPath!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,

                )
            ),
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child:  ExpandableTextWidget(
                        text: ""+serviceModel.serviceDescription!)
                ),
               // Text("${ serviceModel.serviceDescription!}: \n Related Service Displayed here"),
                BookList(id: serviceModel.serviceID!,)
              ],
            ),

          )
        ],

      ),
     // bottomNavigationBar:
      //NewBottomBarr(),
    );
  }
}

