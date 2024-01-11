class NetworkUrls {
  static const String user = '/user';
  static const String login = '$user/auth/login';
  static const String resetPassword = '$user/auth/forgot-password';
  static const String factoryFloor = '$user/factory-floors';
  static const String logout = '$user/auth/logout';
  static const String signUp = '$user/sign-up';
  static const String info = '$user/me/info';
  static const String searchPartner = '$user/companies/search/partners';
  static const String favoritePartner = '$user/companies/favorite/partners';
  static const String updateAvatar = '$user/update-avatar';

  static bool requireAuthentication(String url) {
    return ![
      login,
      resetPassword,
      signUp,
    ].contains(url);
  }
}
