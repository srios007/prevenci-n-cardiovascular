import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prevencion_cardiovascular/app/modules/home/controllers/home_controller.dart';
import 'package:prevencion_cardiovascular/app/modules/home/widgets/custom_drawer.dart';
import 'package:prevencion_cardiovascular/app/widgets/purple_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página principal'),
        centerTitle: true,
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
                      children: [
                        PurpleButton(
                          isLoading: false.obs,
                          onPressed: controller.createInfo,
                        ),
                      ],
                    ),
                  )
                ],
              );
      }),
    );
  }
}
