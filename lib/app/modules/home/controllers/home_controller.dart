import 'package:get/get.dart';
import 'package:prevencion_cardiovascular/app/models/models.dart';
import 'package:prevencion_cardiovascular/app/services/model_services/health_info_service.dart';
import 'package:prevencion_cardiovascular/app/services/services.dart';

class HomeController extends GetxController {
  List<HealthInfo> healthInfoList = [];
  RxList shoppingCart = [].obs;
  RxBool isLoading = false.obs;
  User user = User();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;
    await getUser();

    isLoading.value = false;
  }

  /// Trae el usuario que inicia sesión
  getUser() async {
    user = (await userService.getCurrentUser())!;
    healthInfoList = await healthInfoService.getHealthInfo();
  }

  // createInfo() async {
  //   final HealthInfo info = HealthInfo(
  //     created: DateTime.now(),
  //     title: 'Mantenga sus niveles de colesterol y triglicéridos bajo control',
  //     label: '''''',
  //     imageUrl: '',
  //   );
  //   await healthInfoService.addHealthInfo(info);
  // }
}
