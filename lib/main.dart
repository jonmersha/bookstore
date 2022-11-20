import 'package:bookstore/features/presentation/page/home/main_landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/helper/dependencies.dart' as dep;
import 'features/controllers/BranchServiceController.dart';
import 'features/controllers/DocumentController.dart';
import 'features/route/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<DocumentController>().getDocumentList();
    Get.find<BranchServiceController>().getServiceList();

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: MainLandingPage(),
      initialRoute: RouteHelper.initial,
    );
  }
}
