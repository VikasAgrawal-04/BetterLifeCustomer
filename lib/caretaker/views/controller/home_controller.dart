import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:widgets/widgets.dart';

class HomeController extends GetxController {
  HomeController(this.api);
  final ApiRepo api;

  RxInt selectedIndex = 0.obs;
  final tabs = const ['Todays', 'Past', 'Upcoming'];
  RxList<CareAppointment> newAppointments = <CareAppointment>[].obs;
  RxList<CareAppointment> homeAppointments = <CareAppointment>[].obs;
  final status = Status.initial.obs;
  final apptDetails = CareData().obs;

  AppointmentType get currentAppointmentType =>
      AppointmentType.values[selectedIndex.value];

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

  Future<void> getCareAppointment() async {
    homeAppointments.clear();
    status.value = Status.loading;
    final response = await api.getCareAppointment(type: currentAppointmentType);
    print('Hello');
    response.when(success: (value) {
      if (value.isEmpty) {
        status.value = Status.empty;
      } else {
        status.value = Status.success;
        if (currentAppointmentType == AppointmentType.present ||
            currentAppointmentType == AppointmentType.past) {
          for (final loop in value) {
            loop.viewDetials = true;
            homeAppointments.add(loop);
          }
        } else {
          homeAppointments.addAll(value);
        }
      }
    }, failure: (error) {
      print('Failure in CareAppointment $error');
    });
  }

  Future<void> getApptDetails(int apptId) async {
    status.value = Status.loading;
    final response = await api.getApptDetails(apptId);

    response.when(success: (value) {
      status.value = Status.success;
      if (value.code == '200') {
        apptDetails.value = value.data;
      }
    }, failure: (error) {
      status.value = Status.error;
      print('Failure in getApptDetails $error');
    });
  }

  Future<void> rfh() async {
    await getCareAppointment();
  }

  Future<void> verifyPatientOtp(
      {required String otp, required int apptId}) async {
    status.value = Status.loading;
    final response = await api.verifyPatientOtp(otp: otp, apptId: apptId);
    response.when(success: (value) {
      status.value = Status.success;
      DialogService.success(
        value['message'].toString(),
        onTap: () async {
          await getApptDetails(apptId);
          status.value = Status.success;
          Get.back<void>();
        },
        buttonText: 'OK',
      );
    }, failure: (error) {
      status.value = Status.error;
      DialogService.failure(error, onCancel: () async {
        await getApptDetails(apptId);
        Get.back<void>();
      });
    });
  }
}
