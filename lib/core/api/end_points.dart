class EndPoint {
  static String baseUrl = "https://todo.iraqsapp.com/";
  static String signIn = "auth/login";
  static String signUp = "auth/register";
  static String logout = "auth/logout";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String experienceYear = "experienceYears";
  static const String id = "_id";
  static const String phoneNumber = "phone";
  static const String password = "password";
  static const String accessToken = "access_token";
  static const String refreshToken = "refresh_token";
  static const String address = "address";
  static String message = "message";
  static String experienceLevel = "level";
  static String name = "displayName";

  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
