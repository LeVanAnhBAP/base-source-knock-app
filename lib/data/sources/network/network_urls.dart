class NetworkUrls {
  static const String users = '/user';
  static const String login = '$users/auth/login';
  static const String resetPassword = '$users/auth/forgot-password';
  static const String logout = '$users/auth/logout';
  static const String signUp = '$users/sign-up';
  static const String account = '$users/account';
  static const String getCategories = '/api/categories';
  static const String getCollections = '/api/collections';
  static const String getQuizzes = '/api/quizzes';
  static const String getQuizById = '/api/quizzes/{quiz_id}';
  static const String getTags = '/api/tags';

  static bool requireAuthentication(String url) {
    return ![
      login,
      resetPassword,
      signUp,
    ].contains(url);
  }
}
