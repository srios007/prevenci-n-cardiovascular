import 'package:get/get.dart';
import 'package:prevencion_cardiovascular/app/models/models.dart';
import 'package:prevencion_cardiovascular/app/services/model_services/health_info_service.dart';
import 'package:prevencion_cardiovascular/app/services/services.dart';

class HomeController extends GetxController {
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
  }

  createInfo() async {
    final HealthInfo info = HealthInfo(
      created: DateTime.now(),
      title: 'Control del estrés, hipertensión y diabetes',
      label: '''
      Evitar el consumo de tabaco y sus derivados, así como la exposición al humo de estos productos.
      
      Eliminar la ingesta en exceso de bebidas alcohólicas, ya que puede debilitar el músculo cardiaco, causar complicaciones de salud e incluso la muerte.
      
      Nunca es muy tarde para dejar de fumar o beber alcohol; ambos contienen sustancias adictivas y perjudiciales para la salud que producen aumento de la frecuencia cardíaca y de la presión arterial, entre otros efectos cardiacos y cerebrovasculares.
      
      Pedir ayuda al prestador de salud más cercano para iniciar tratamiento si se desea de dejar de consumir tabaco y/o vapear, al igual que con las bebidas alcohólicas.
      ''',
      imageUrl: '',
    );
    await healthInfoService.addHealthInfo(info);
  }
}
