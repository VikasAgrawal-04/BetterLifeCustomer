class Endpoints {
  static const String signUp = '/customerRegistration';
  static const String signUpCaretaker = '/caretaker-register';
  static const String loginCustomer = '/login';

  static const String showProfile = '/show-profile';
  static const String showReward = '/show-reward-customer';
  static const String changeUserPassword = '/change-user-password';
  static const String resetPassword = '/resetPassword',
      sendOtp = '/resendOTP',
      verifyPasswordOTP = '/verifyPasswordOTP',
      verifyOtp = '/verifyOTP',
      verifyCareTakerOtp = '/otp-verify';

  static const String showTransactionHistory = '/show-transaction-history';

  static const String futureAppointments = '/futureAppointments';
  static const String pastAppointments = '/pastAppointments';
  static const String presentAppointments = '/presentAppointments';

  static String createNewAppointment = '/newAppointment';
  static String viewFutureAppointment = '/viewFutureAppointment';
  static String viewPastAppointment = '/viewPastAppointment';
  static String viewDiets = '/viewDiets';
  static String viewTests = '/viewTests';
  static String viewNotes = '/viewNotes';
  static String viewPrescriptions = '/viewPrescriptions';
  static String previousCaretakers = '/previousCaretakers';
  static String selectPreviousCareTakers = '/selectPreviousCareTakers';
  static String rescheduleAppointment = '/rescheduleAppointment';

  static String cancelAppointment = '/cancleAppointment';
  static String serviceRating = '/serviceRating';
  static String serviceRatingCaretaker = '/serviceRatingCaretaker';
  static String getLastAppointment = '/getLastAppointment';

  static const String languages = '/show-language';
  static const String pincodes = '/show-pincode';

  static const String newAppointment = '/new-appointment';
  static const String todayAppointment = '/todays-appointment';
  static const String upcomingAppointment = '/upcoming-appointment';
  static const String pastAppointment = '/past-appointment';
  static const String showAptDetail = '/show-appointment';
  static const String startAppointment = '/start-appointment';
  static const String acceptAppointment = '/accept-appointment';
  static const String rejectAppointment = '/reject-appointment';
}
