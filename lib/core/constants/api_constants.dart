class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://finall-5w5w.onrender.com/';
  static const String signupEndPoint = 'users/signup';
  static const String loginEndPoint = 'users/signin';
  static const String accountInfoEndPoint = 'users/getme';
  static const String logoutEndPoint = 'users/logout';
  static const String removeAccountEndPoint = 'users/delete';
  static const String changeAccountInfoEndPoint = 'users';
  static const String changePasswordEndPoint = 'users';
  static const String forgetPasswordEndPoint = '/users/forgot-password';
  static const String verifyEmailEndPoint = 'users/sendagain';
  static const String suggestionEndPoint = 'message';
 // static const String enterRecordEndPoint = 'https://deployment-dl-model-production.up.railway.app/predict_route?audio_file?';
  static const String enterRecordEndPoint = 'http://ec2-34-200-78-89.compute-1.amazonaws.com:8000/predict';
  static const String enterEmotionEndPoint = 'users/record';
  static const String dailyHistoryEndPoint = 'users/history/day/';
  static const String weeklyHistoryEndPoint = 'users/history/month/';
  static const String monthlyHistoryEndPoint = 'users/history/year/';
}

//static const String analysisAudioEndPoint = 'http://ec2-34-200-78-89.compute-1.amazonaws.com:8000/predict';
