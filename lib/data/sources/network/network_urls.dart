class NetworkUrls {
  static const String user = '/user';
  static const String login = '$user/auth/login';
  static const String resetPassword = '$user/auth/forgot-password';
  static const String factoryFloor = '$user/factory-floors';
  static const String logout = '$user/auth/logout';
  static const String signUp = '$user/sign-up';
  static const String info = '$user/me/info';
  static const String notify = '$user/me/notify';
  static const String unreadCount = '$myNotifications/count-unread';
  static const String myNotifications = '$user/my-notifications';
  static const String searchPartner = '$user/companies/search/partners';
  static const String favoritePartner = '$user/companies/favorite/partners';
  static const String updateAvatar = '$user/update-avatar';
  static const String member = '$user/company/members';
  static const String share = '/share';
  static const String staticData = '$share/static-data';
  static const String addressInfo = "$share/address-info";
  static const String taxRate = "$share/get-tax-rate";
  static const String uploadFiles = "$share/upload-files";
  static const String uploadMulti = "$share/s3-upload-multi";
  static const String prefecture = '$addressInfo/prefectures';
  static const String city = '$addressInfo/cities';
  static const String town = '$addressInfo/towns';
  static const String listRoomChatDeal = '$user/chat/list-room-chat-deal';

  static bool requireAuthentication(String url) {
    return ![
      login,
      resetPassword,
      signUp,
    ].contains(url);
  }
}
