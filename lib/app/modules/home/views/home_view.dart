import 'package:prevencion_cardiovascular/app/utils/utils.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              await Get.toNamed(Routes.SHOPPING_CART);
              controller.getData();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.shopping_cart,
                color: Palette.white,
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(
        contextGlobal: context,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: []
                    ),
                  )
                ],
              );
      }),
    );
  }
}
 