
import 'package:bookstore/features/presentation/page/book/book_cat_list.dart';
import 'package:bookstore/features/presentation/page/documents/PopularBook.dart';
import 'package:bookstore/features/presentation/widget/BigText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/BranchServiceController.dart';
import '../../../../utils/app_colors.dart';


class BookHome extends StatefulWidget {
  const BookHome({Key? key}) : super(key: key);
  @override
  State<BookHome> createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BranchServiceController>(builder: (serviceController){
      return serviceController.isLoaded?
      Column(
        children: [
          PopularBook(),
          SizedBox(
            height: 10,
          ),
          BigText(text: "Books By Category",color: Colors.blueAccent,),

         BookCatList(serviceController:serviceController),
        ],
      ):CircularProgressIndicator(
        color: AppColors.mainColor,
      );
    });
  }
}


//1.23.58 Stoped Here
//1.56.48 Stoped here
