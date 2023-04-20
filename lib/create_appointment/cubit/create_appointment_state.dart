// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'create_appointment_cubit.dart';

/// {@template create_appointment}
/// CreateAppointmentState description
/// {@endtemplate}
class CreateAppointmentState extends Equatable {
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

  final int appointmentDuration;

  final String? caretakerLanguage;
  final String? caretakerOtherLanguage;
  final PageController pageController;
  final int step;
  final GlobalKey<FormState> formKey;

  const CreateAppointmentState({
    this.dateOfVisit,
    this.pickupTime,
    required this.pickupAddressController,
    required this.pickupPincodeController,
    required this.hospitalController,
    required this.doctorsNameController,
    required this.patientNameController,
    required this.mobileNumberController,
    this.purposeOfVisit,
    this.purposeOfVisitList = const [],
    required this.relationsWithApplicant,
    this.relationWithApplicant,
    required this.caretakersCount,
    required this.genders,
    required this.caretakersCountList,
    required this.taxiTypes,
    required this.taxiType,
    required this.taxiRequired,
    this.caretakerWhoCanDriveCar = false,
    this.gender,
    this.caretakerGender,
    required this.caretakerLanguageList,
    required this.apppointmentDurationList,
    required this.previousCaretakers,
    required this.appointmentDuration,
    this.caretakerLanguage,
    this.caretakerOtherLanguage,
    required this.pageController,
    required this.step,
    required this.formKey,
  });

  factory CreateAppointmentState.initial() {
    const puposeOfVisitList = ['Check Up', 'Consultation', 'Surgery', 'Other'];
    const relationsWithApplicant2 = [
      'Self',
      'Spouse',
      'Son',
      'Daughter',
      'Father',
      'Mother',
      'Brother',
      'Sister',
      'Other'
    ];
    const taxiTypes2 = ['AC', 'Non AC'];
    // const caretakerLanguageList2 = [
    //   'English',
    //   'Hindi',
    //   'Konkani',
    //   'Marathi',
    //   'Kannada',
    //   'Malayalam',
    //   'Other'
    // ];
    const genders2 = ['Male', 'Female', 'Other'];
    return CreateAppointmentState(
      previousCaretakers: const [],
      apppointmentDurationList:
          List.generate(10, (index) => index + 1).toList(),
      appointmentDuration: 1,
      formKey: GlobalKey<FormState>(),
      pageController: PageController(),
      step: 0,
      pickupAddressController: TextEditingController(),
      pickupPincodeController: TextEditingController(),
      hospitalController: TextEditingController(),
      doctorsNameController: TextEditingController(),
      patientNameController: TextEditingController(),
      mobileNumberController: TextEditingController(),
      purposeOfVisitList: puposeOfVisitList,
      relationsWithApplicant: relationsWithApplicant2,
      caretakersCount: '1',
      genders: genders2,
      caretakersCountList:
          List.generate(10, (index) => (index + 1).toString()).toList(),
      taxiTypes: taxiTypes2,
      taxiType: taxiTypes2.first,
      taxiRequired: false,
      caretakerLanguageList: Language.values,
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
      appointmentDuration,
      caretakerLanguage,
      caretakerOtherLanguage,
      pageController,
      step,
      formKey,
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
    int? appointmentDuration,
    String? caretakerLanguage,
    String? caretakerOtherLanguage,
    PageController? pageController,
    int? step,
    GlobalKey<FormState>? formKey,
  }) {
    return CreateAppointmentState(
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
      appointmentDuration: appointmentDuration ?? this.appointmentDuration,
      caretakerLanguage: caretakerLanguage ?? this.caretakerLanguage,
      caretakerOtherLanguage:
          caretakerOtherLanguage ?? this.caretakerOtherLanguage,
      pageController: pageController ?? this.pageController,
      step: step ?? this.step,
      formKey: formKey ?? this.formKey,
    );
  }

  String getCaretakerLanguage() =>
      caretakerLanguage?.toLowerCase() == Language.other.name.toLowerCase()
          ? caretakerOtherLanguage ?? ''
          : caretakerLanguage ?? '';
}
