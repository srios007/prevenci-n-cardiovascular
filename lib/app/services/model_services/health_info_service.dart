import 'package:prevencion_cardiovascular/app/models/models.dart';
import 'package:prevencion_cardiovascular/app/services/firebase_services/database_service.dart';
import 'package:prevencion_cardiovascular/app/utils/utils.dart';

class HealthInfoService {
  static String healthReference = firebaseReferences.healthInfo;

  Future<List<HealthInfo>> getHealthInfo() async {
    try {
      connectionStatus.getNormalStatus();

      final List<HealthInfo> healthInfoList = [];

      final querySnapshot = await database.getData(healthReference);

      if (querySnapshot.docs.isEmpty) return [];
      for (final element in querySnapshot.docs) {
        final HealthInfo healthInfo = HealthInfo.fromJson(
          element.data() as Map<String, dynamic>,
          isGet: true,
        );
        healthInfo.id = element.id;
        healthInfoList.add(healthInfo);
      }

      return healthInfoList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> addHealthInfo(HealthInfo info) async {
    try {
      connectionStatus.getNormalStatus();
      final result = await database.addDocument(healthReference, info.toJson());
      info.id = result.id;
      await result.set({...info.toJson(), 'id': result.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}

HealthInfoService healthInfoService = HealthInfoService();
