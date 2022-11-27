import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prevencion_cardiovascular/app/modules/home/controllers/home_controller.dart';
import 'package:prevencion_cardiovascular/app/modules/home/widgets/custom_drawer.dart';
import 'package:prevencion_cardiovascular/app/utils/utils.dart';

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
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final info = controller.healthInfoList[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Palette.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      filterQuality: FilterQuality.none,
                                      imageUrl: info.imageUrl!,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: Get.width - 160,
                                    child: Text(
                                      info.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Palette.darkBlue,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  info.label!,
                                  style: const TextStyle(
                                    color: Palette.darkBlue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      childCount: controller.healthInfoList.length,
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
