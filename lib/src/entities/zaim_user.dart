part of dart_zaim_client;

class ZaimUser {
  int id;
  String login;
  String name;
  int inputCount;
  int dayCount;
  int repeatCount;
  int day;
  int week;
  int month;
  String currencyCode;
  String profileImageUrl;
  String coverImageUrl;
  String profileModified;

  ZaimUser(Map<String, dynamic> user) {
    this.id = user['id'];
    this.login = user['login'];
    this.name = user['name'];
    this.inputCount = user['input_count'];
    this.dayCount = user['day_count'];
    this.repeatCount = user['repeat_count'];
    this.day = user['day'];
    this.week = user['week'];
    this.month = user['month'];
    this.currencyCode = user['currency_code'];
    this.profileImageUrl = user['profile_image_url'];
    this.coverImageUrl = user['cover_image_url'];
    this.profileModified = user['profile_modified'];
  }
}
