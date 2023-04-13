class Endpoints {
  static const String signUp = '/customerRegistration';
  static const String loginCustomer = '/login';

  static const String showProfile = '/show-profile';
  static const String showReward = '/show-reward-customer';
  static const String changeUserPassword = '/change-user-password';
  static const String resetPassword = '/resetPassword',
      sendOtp = '/resendOTP',
      verifyOtp = '/verifyOTP';

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
  static String rescheduleAppointment = '/rescheduleAppointment';
}
