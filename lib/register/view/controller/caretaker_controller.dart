import 'package:api/api.dart';
import 'package:better_life_customer/otp/view/otp_page.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:notifications/notifications.dart';
import 'package:widgets/widgets.dart';

class CaretakerController extends GetxController {
  CaretakerController(this.api);
  final ApiRepo api;

  //Declarations
  final languages = <String>[].obs;
  final index = 0.obs;
  late final pageController = PageController(initialPage: index.value);
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final mobile = TextEditingController();
  final gender = 'Male'.obs;
  final profile = 'Full Time'.obs;
  final interview = 'Yes'.obs;
  DateTime? dob;
  final adress = TextEditingController();
  final pinCode = TextEditingController();
  final aadhar = TextEditingController();
  final qualification = TextEditingController();
  final curEmpl = TextEditingController();
  RxBool canDrive = true.obs;
  final pncd = 'Select Pincode'.obs;
  RxList<String> selectedLanguages = <String>[].obs;
  RxList<String> pincodes = <String>[].obs;
  RxList<String> selectedPincodes = <String>[].obs;

  final genders2 = ['Male', 'Female', 'Other'];
  final profileList = ['Full Time', 'Part Time'];
  final interviewList = ['Yes', 'No'];

  final key = GlobalKey<FormState>();

  void validatePage() {
    final validated = key.currentState?.validate() ?? false;
    if (!validated) {
      return;
    }
    if (index.value == 0 && password.text != confirmPassword.text) {
      const GetSnackBar(
        message: 'Password does not match!',
        backgroundColor: Colors.red,
      ).show();
      return;
    }
    index.value++;
    changeIndex(index.value);
  }

  Future<void> completeRegistration() async {
    final validated = key.currentState?.validate() ?? false;
    if (!validated) {
      return;
    }
    if (password.text != confirmPassword.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }
    await registerCaretaker();
  }

  void back() {
    index.value--;
    changeIndex(index.value);
  }

  void profileChange(String? value) {
    profile.value = value ?? profile.value;
  }

  void genderChange(String? gdr) {
    gender.value = gdr ?? gender.value;
  }

  void interviewChange(String? value) {
    interview.value = value ?? interview.value;
  }

  Future<void> changeIndex(int i, {bool validate = true}) async {
    if (validate) {
      if (pageController.hasClients) {
        await pageController.animateToPage(
          i,
          duration: kDuration,
          curve: Curves.fastLinearToSlowEaseIn,
        );
      }
    }
  }

  void drive(bool value) {
    canDrive.value = value;
  }

  void selectLang(String lang, bool check) {
    if (selectedLanguages.contains(lang)) {
      selectedLanguages.remove(lang);
    } else {
      selectedLanguages.add(lang);
    }
  }

  void selectPincode(String? value) {
    pncd.value = value ?? pncd.value;
  }

  Future<void> setPincode(String value) async {
    if (!selectedPincodes.contains(value)) {
      const GetSnackBar(
        message: 'Pincode Added',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ).show();
      selectedPincodes.add(value);
    } else {
      const GetSnackBar(
        message: 'Pincode Already Added',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ).show();
    }
  }

  /////////////Api Calls\\\\\\\\\\\\\\\\
  Future<void> fetchLanguages() async {
    final result = await api.fetchLanguage();
    result.when(
      success: (values) {
        languages
          ..clear()
          ..addAll(values);
        return null;
      },
      failure: (exception) {
        return null;
      },
    );
  }

  Future<void> fetchPincodes() async {
    final result = await api.fetchPincodes();
    result.when(
      success: (values) {
        pincodes
          ..clear()
          ..add('Select Pincode');
        for (final data in values) {
          final pin = data['pincode'];
          if (!pincodes.contains(pin)) {
            pincodes.add(pin.toString());
          }
        }

        return null;
      },
      failure: (exception) {
        return null;
      },
    );
  }

  Future<void> registerCaretaker() async {
    final token = await PushNotificationService().getFCMtoken();
    final result = await api.registerCaretaker(
      data: SignUpCaretakerModel(
        fullname: fullName.text,
        emailid: email.text,
        mobileno: mobile.text,
        password: password.text,
        confirmPassword: confirmPassword.text,
        gender: gender.value,
        dateofbirth: DateFormat('yyyy-MM-dd').format(dob ?? DateTime(2000)),
        address: adress.text,
        pincode: pinCode.text,
        aadhar: aadhar.text,
        qualification: qualification.text,
        employedat: curEmpl.text,
        profile: profile.value == 'Full Time' ? 'Full' : 'Part',
        interview: interview.value,
        candrive: canDrive.isTrue ? 'Yes' : 'No',
        languageList: selectedLanguages,
        pincodeList: selectedPincodes,
        firebaseDeviceToken: token,
      ),
    );
    result.when(
      success: (data) {
        DialogService.showDialog<void>(
          child: MailSentDialog(
            message: data['message'].toString(),
            onContinue: () {
              Get.offAll<void>(
                OtpPage(
                  contactNumber: mobile.text,
                  fromForgotPassword: false,
                  careTaker: true,
                ),
              );
            },
          ),
        );
      },
      failure: (error) {
        DialogService.failure(error);
      },
    );
  }
}
