import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../widget/BigText.dart';
import 'components/book_home.dart';

class MainLandingPage extends StatefulWidget {
  const MainLandingPage({Key? key}) : super(key: key);

  @override
  State<MainLandingPage> createState() => _MainLandingPageState();
}
class _MainLandingPageState extends State<MainLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //Showing the header
        Container(
          child: Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [
                    BigText(
                      color:AppColors.mainColor,
                      text:"Popular books",
                      size: 20,),


                  ],
                ),

              ],
            ),
          ),
        ),
      // Showing the Body
        const Expanded(
            child: SingleChildScrollView(
                child: BookHome(),
            ),
        ),

      ],
    ));
  }
}
