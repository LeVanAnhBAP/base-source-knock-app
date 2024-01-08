class NetworkUrls {
  static const String user = '/user';
  static const String login = '$user/auth/login';
  static const String resetPassword = '$user/auth/forgot-password';
  static const String factoryFloor = '$user/factory-floors';
  static const String logout = '$user/auth/logout';
  static const String signUp = '$user/sign-up';
  static const String account = '$user/account';
  static const String searchPartner = '$user/companies/search/partners';

  static bool requireAuthentication(String url) {
    return ![
      login,
      resetPassword,
      signUp,
    ].contains(url);
  }
}
