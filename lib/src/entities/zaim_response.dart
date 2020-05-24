part of dart_zaim_client;

class MoneyResponse {
  ZaimMoney money;
  ZaimUser user;

  MoneyResponse({this.money, this.user});
}

class CreateMoneyResponse {
  ZaimMoney money;
  ZaimUser user;
  ZaimPlace place;

  CreateMoneyResponse({this.money, this.user, this.place});
}
