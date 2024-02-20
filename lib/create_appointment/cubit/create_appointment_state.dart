part of 'create_appointment_cubit.dart';

/// {@template create_appointment}
/// CreateAppointmentState description
/// {@endtemplate}
class CreateAppointmentState extends Equatable {

  const CreateAppointmentState({
    required this.pickupAddressController,
    required this.pickupPincodeController,
    required this.hospitalController,
    required this.doctorsNameController,
    required this.patientNameController,
    required this.mobileNumberController,
    required this.relationsWithApplicant,
    required this.caretakersCount,
    required this.genders,
    required this.caretakersCountList,
    required this.taxiTypes,
    required this.taxiType,
    required this.taxiRequired,
    required this.caretakerLanguageList,
    required this.apppointmentDurationList,
    required this.previousCaretakers,
    required this.previousCaretakersLoading,
    required this.appointmentDuration,
    required this.pageController,
    required this.step,
    required this.formKey,
    required this.lastAppointmentLoading,
    required this.isLoading,
    required this.isCaretakerLanguageEditable,
    required this.isCaretakerGenderEditable,
    required this.iscaretakerWhoCanDriveCarEditable,
    required this.isPincodeEditable,
    required this.pickUpLatitude,
    required this.pickUpLongitude,
    required this.hospitalLongitude,
    required this.hospitalLatitude,
    this.dateOfVisit,
    this.pickupTime,
    this.purposeOfVisit,
    this.purposeOfVisitList = const [],
    this.relationWithApplicant,
    this.caretakerWhoCanDriveCar = false,
    this.gender,
    this.caretakerGender,
    this.caretakerLanguage,
    this.caretakerOtherLanguage,
    this.appointmentDetails,
    this.caretaker = const [],
  });
  factory CreateAppointmentState.initial({
    AppointmentDetails? appointment,
    int step = 0,
    PageController? pageController,
  }) {
    const puposeOfVisitList = ['Check Up', 'Consultation', 'Surgery', 'Other'];
    const taxiTypes2 = ['AC', 'Non AC'];
    const genders2 = ['Male', 'Female', 'Other'];
    const relationsWithApplicant2 = [
      'Self',
      'Spouse',
      'Son',
      'Daughter',
      'Father',
      'Mother',
      'Brother',
      'Sister',
      'Other',
    ];

    return CreateAppointmentState(
      isCaretakerGenderEditable: true,
      isCaretakerLanguageEditable: true,
      isPincodeEditable: true,
      iscaretakerWhoCanDriveCarEditable: true,
      isLoading: false,
      previousCaretakersLoading: false,
      lastAppointmentLoading: false,
      previousCaretakers: const [],
      apppointmentDurationList: List.generate(2, (index) => index + 1).toList(),
      appointmentDuration: TextEditingController(),
      formKey: GlobalKey<FormState>(),
      pageController: pageController ?? PageController(initialPage: step),
      step: step,
      pickupAddressController:
          TextEditingController(text: appointment?.pickAddress),
      pickupPincodeController:
          TextEditingController(text: appointment?.pickPincode),
      hospitalController: TextEditingController(text: appointment?.hospital),
      doctorsNameController: TextEditingController(text: appointment?.doctor),
      patientNameController:
          TextEditingController(text: appointment?.patientName),
      mobileNumberController:
          TextEditingController(text: appointment?.patientMobile),
      purposeOfVisitList: puposeOfVisitList,
      relationsWithApplicant: relationsWithApplicant2,
      caretakersCount: '1',
      genders: genders2,
      caretakersCountList:
          List.generate(2, (index) => (index + 1).toString()).toList(),
      taxiTypes: taxiTypes2,
      taxiType: taxiTypes2.first,
      taxiRequired: appointment?.taxiNeeded ?? false,
      caretakerLanguageList: Language.values,
      caretakerGender: appointment?.caretakerGender,
      caretakerLanguage: appointment?.caretakerLanguage,
      gender: appointment?.patientGender,
      purposeOfVisit: appointment?.purpose,
      relationWithApplicant: appointment?.realationship,
      pickUpLatitude: 0.0,
      pickUpLongitude: 0.0,
      hospitalLatitude: 0.0,
      hospitalLongitude: 0.0,
    );
  }
  final DateTime? dateOfVisit;
  final DateTime? pickupTime;
  final TextEditingController pickupAddressController;
  final TextEditingController pickupPincodeController;
  final TextEditingController hospitalController;
  final TextEditingController doctorsNameController;
  final TextEditingController patientNameController;
  final TextEditingController mobileNumberController;
  final String? purposeOfVisit;
  final List<String> purposeOfVisitList;
  final List<String> relationsWithApplicant;
  final String? relationWithApplicant;
  final String caretakersCount;
  final List<String> genders;
  final List<String> caretakersCountList;
  final List<String> taxiTypes;
  final String taxiType;
  final bool taxiRequired;
  final bool caretakerWhoCanDriveCar;

  final String? gender;
  final String? caretakerGender;
  final List<Language> caretakerLanguageList;
  final List<int> apppointmentDurationList;

  final List<Caretaker> previousCaretakers;
  final bool previousCaretakersLoading;

  final TextEditingController appointmentDuration;

  final String? caretakerLanguage;
  final String? caretakerOtherLanguage;
  final PageController pageController;
  final int step;
  final GlobalKey<FormState> formKey;

  final AppointmentDetails? appointmentDetails;
  final bool lastAppointmentLoading;
  final bool isLoading;

  final bool isCaretakerLanguageEditable;
  final bool isCaretakerGenderEditable;
  final bool iscaretakerWhoCanDriveCarEditable;
  final bool isPincodeEditable;
  final List<int> caretaker;
  final double pickUpLatitude;
  final double pickUpLongitude;
  final double hospitalLatitude;
  final double hospitalLongitude;

  CreateAppointmentState merge(AppointmentDetails? appointment) {
    return CreateAppointmentState(
      caretaker: appointment?.caretaker ?? [],
      isCaretakerGenderEditable: false,
      isCaretakerLanguageEditable: false,
      isPincodeEditable: false,
      iscaretakerWhoCanDriveCarEditable: false,
      isLoading: isLoading,
      previousCaretakersLoading: previousCaretakersLoading,
      lastAppointmentLoading: lastAppointmentLoading,
      previousCaretakers: previousCaretakers,
      apppointmentDurationList: apppointmentDurationList,
      appointmentDuration: appointmentDuration,
      formKey: formKey,
      pageController: pageController,
      step: step,
      pickupAddressController:
          TextEditingController(text: appointment?.pickAddress),
      pickupPincodeController:
          TextEditingController(text: appointment?.pickPincode),
      hospitalController: TextEditingController(text: appointment?.hospital),
      doctorsNameController: TextEditingController(text: appointment?.doctor),
      patientNameController:
          TextEditingController(text: appointment?.patientName),
      mobileNumberController:
          TextEditingController(text: appointment?.patientMobile),
      purposeOfVisitList: purposeOfVisitList,
      relationsWithApplicant: relationsWithApplicant,
      caretakersCount: caretakersCount,
      genders: genders,
      caretakersCountList: caretakersCountList,
      taxiTypes: taxiTypes,
      taxiType: appointment?.acTaxi ?? false ? 'AC' : 'Non AC',
      taxiRequired: appointment?.taxiNeeded ?? false,
      caretakerLanguageList: caretakerLanguageList,
      caretakerGender: appointment?.caretakerGender,
      caretakerLanguage: appointment?.caretakerLanguage,
      gender: appointment?.patientGender,
      purposeOfVisit: appointment?.purpose,
      relationWithApplicant: appointment?.realationship,
      pickUpLatitude: appointment?.pickUpLatitude ?? 0.0,
      pickUpLongitude: appointment?.pickUpLongitude ?? 0.0,
      hospitalLatitude: appointment?.hospitalLatitude ?? 0.0,
      hospitalLongitude: appointment?.hospitalLongitude ?? 0.0,
    );
  }

  @override
  List<Object?> get props {
    return [
      dateOfVisit,
      pickupTime,
      pickupAddressController,
      pickupPincodeController,
      hospitalController,
      doctorsNameController,
      patientNameController,
      mobileNumberController,
      purposeOfVisit,
      purposeOfVisitList,
      relationsWithApplicant,
      relationWithApplicant,
      caretakersCount,
      genders,
      caretakersCountList,
      taxiTypes,
      taxiType,
      taxiRequired,
      caretakerWhoCanDriveCar,
      gender,
      caretakerGender,
      caretakerLanguageList,
      apppointmentDurationList,
      previousCaretakers,
      previousCaretakersLoading,
      appointmentDuration,
      caretakerLanguage,
      caretakerOtherLanguage,
      pageController,
      step,
      formKey,
      appointmentDetails,
      lastAppointmentLoading,
      isLoading,
      isCaretakerLanguageEditable,
      isCaretakerGenderEditable,
      iscaretakerWhoCanDriveCarEditable,
      isPincodeEditable,
      pickUpLatitude,
      pickUpLongitude,
      hospitalLatitude,
      hospitalLongitude,
    ];
  }

  CreateAppointmentState copyWith({
    DateTime? dateOfVisit,
    DateTime? pickupTime,
    TextEditingController? pickupAddressController,
    TextEditingController? pickupPincodeController,
    TextEditingController? hospitalController,
    TextEditingController? doctorsNameController,
    TextEditingController? patientNameController,
    TextEditingController? mobileNumberController,
    String? purposeOfVisit,
    List<String>? purposeOfVisitList,
    List<String>? relationsWithApplicant,
    String? relationWithApplicant,
    String? caretakersCount,
    List<String>? genders,
    List<String>? caretakersCountList,
    List<String>? taxiTypes,
    String? taxiType,
    bool? taxiRequired,
    bool? caretakerWhoCanDriveCar,
    String? gender,
    String? caretakerGender,
    List<Language>? caretakerLanguageList,
    List<int>? apppointmentDurationList,
    List<Caretaker>? previousCaretakers,
    bool? previousCaretakersLoading,
    TextEditingController? appointmentDuration,
    String? caretakerLanguage,
    String? caretakerOtherLanguage,
    PageController? pageController,
    int? step,
    GlobalKey<FormState>? formKey,
    AppointmentDetails? appointmentDetails,
    bool? lastAppointmentLoading,
    bool? isLoading,
    bool? isCaretakerLanguageEditable,
    bool? isCaretakerGenderEditable,
    bool? iscaretakerWhoCanDriveCarEditable,
    bool? isPincodeEditable,
    List<int>? caretaker,
    double? pickUpLatitude,
    double? pickUpLongitude,
    double? hospitalLatitude,
    double? hospitalLongitude,
  }) {
    return CreateAppointmentState(
      pickUpLatitude: pickUpLatitude ?? this.pickUpLatitude,
      pickUpLongitude: pickUpLongitude ?? this.pickUpLongitude,
      hospitalLatitude: hospitalLatitude ?? this.hospitalLatitude,
      hospitalLongitude: hospitalLatitude ?? this.hospitalLongitude,
      dateOfVisit: dateOfVisit ?? this.dateOfVisit,
      pickupTime: pickupTime ?? this.pickupTime,
      pickupAddressController:
          pickupAddressController ?? this.pickupAddressController,
      pickupPincodeController:
          pickupPincodeController ?? this.pickupPincodeController,
      hospitalController: hospitalController ?? this.hospitalController,
      doctorsNameController:
          doctorsNameController ?? this.doctorsNameController,
      patientNameController:
          patientNameController ?? this.patientNameController,
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      purposeOfVisit: purposeOfVisit ?? this.purposeOfVisit,
      purposeOfVisitList: purposeOfVisitList ?? this.purposeOfVisitList,
      relationsWithApplicant:
          relationsWithApplicant ?? this.relationsWithApplicant,
      relationWithApplicant:
          relationWithApplicant ?? this.relationWithApplicant,
      caretakersCount: caretakersCount ?? this.caretakersCount,
      genders: genders ?? this.genders,
      caretakersCountList: caretakersCountList ?? this.caretakersCountList,
      taxiTypes: taxiTypes ?? this.taxiTypes,
      taxiType: taxiType ?? this.taxiType,
      taxiRequired: taxiRequired ?? this.taxiRequired,
      caretakerWhoCanDriveCar:
          caretakerWhoCanDriveCar ?? this.caretakerWhoCanDriveCar,
      gender: gender ?? this.gender,
      caretakerGender: caretakerGender ?? this.caretakerGender,
      caretakerLanguageList:
          caretakerLanguageList ?? this.caretakerLanguageList,
      apppointmentDurationList:
          apppointmentDurationList ?? this.apppointmentDurationList,
      previousCaretakers: previousCaretakers ?? this.previousCaretakers,
      previousCaretakersLoading:
          previousCaretakersLoading ?? this.previousCaretakersLoading,
      appointmentDuration: appointmentDuration ?? this.appointmentDuration,
      caretakerLanguage: caretakerLanguage ?? this.caretakerLanguage,
      caretakerOtherLanguage:
          caretakerOtherLanguage ?? this.caretakerOtherLanguage,
      pageController: pageController ?? this.pageController,
      step: step ?? this.step,
      formKey: formKey ?? this.formKey,
      appointmentDetails: appointmentDetails ?? this.appointmentDetails,
      lastAppointmentLoading:
          lastAppointmentLoading ?? this.lastAppointmentLoading,
      isLoading: isLoading ?? this.isLoading,
      isCaretakerLanguageEditable:
          isCaretakerLanguageEditable ?? this.isCaretakerLanguageEditable,
      isCaretakerGenderEditable:
          isCaretakerGenderEditable ?? this.isCaretakerGenderEditable,
      iscaretakerWhoCanDriveCarEditable: iscaretakerWhoCanDriveCarEditable ??
          this.iscaretakerWhoCanDriveCarEditable,
      isPincodeEditable: isPincodeEditable ?? this.isPincodeEditable,
      caretaker: caretaker ?? this.caretaker,
    );
  }

  String getCaretakerLanguage() =>
      caretakerLanguage?.toLowerCase() == Language.other.name.toLowerCase()
          ? caretakerOtherLanguage ?? ''
          : caretakerLanguage ?? '';
}
