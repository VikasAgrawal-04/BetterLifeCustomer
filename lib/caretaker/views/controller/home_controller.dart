import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:widgets/widgets.dart';

class HomeController extends GetxController {
  HomeController(this.api);
  final ApiRepo api;

  RxInt selectedIndex = 0.obs;
  RxList<CareAppointment> newAppointments = <CareAppointment>[].obs;
  final status = Status.initial.obs;

  Future<void> getNewAppointment() async {
    status.value = Status.loading;
    newAppointments.clear();
    final response = await api.getNewAppointment();
    response.when(
      success: (value) {
        if (value.isEmpty) {
          status.value = Status.empty;
        } else {
          status.value = Status.success;
          newAppointments.addAll(value);
        }
      },
      failure: (error) {},
    );
  }

  Future<void> appointmentAction(
      {required bool accept, required int aptId}) async {
    final response = await api.appointmentAction(accept: accept, aptId: aptId);
    response.when(success: (value) {
      getNewAppointment();
      DialogService.success(value['message'].toString(), onTap: () {
        Get.back<void>();
      });
    }, failure: (error) {
      DialogService.failure(error);
    });
  }
}
