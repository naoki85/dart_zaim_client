part of dart_zaim_client;

enum ZaimMoneyType { PAYMENT, INCOME, TRANSFER }

class ZaimMoneyTypeHelper {
  static List<ZaimMoneyType> values() => ZaimMoneyType.values;

  static ZaimMoneyType valueOf(String value) {
    return values().firstWhere((item) {
      return name(item) == value;
    }, orElse: () => null);
  }

  static String name(ZaimMoneyType enumValue) {
    return enumValue?.toString()?.split('.')?.last?.toLowerCase();
  }
}

class ZaimMoney {
  int id;
  int userId;
  String date;
  String mode;
  int categoryId;
  int genreId;
  int fromAccountId;
  int toAccountId;
  int amount;
  String comment;
  int active;
  String created;
  String currencyCode;
  String name;
  int receiptId;
  String placeUid;
  String place;

  ZaimMoney(Map<String, dynamic> money) {
    this.id = money['id'];
    this.userId = money['user_id'];
    this.date = money['date'];
    this.mode = money['mode'];
    this.categoryId = money['category_id'];
    this.genreId = money['genre_id'];
    this.fromAccountId = money['from_account_id'];
    this.toAccountId = money['to_account_id'];
    this.amount = money['amount'];
    this.comment = money['comment'];
    this.active = money['active'];
    this.created = money['created'];
    this.currencyCode = money['currency_code'];
    this.name = money['name'];
    this.receiptId = money['receipt_id'];
    this.placeUid = money['place_uid'];
    this.place = money['place'];
  }
}
