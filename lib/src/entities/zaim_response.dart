part of dart_zaim_client;

abstract class ResponseBase {
  int requested;
}

class UserVerifyResponse extends ResponseBase {
  ZaimUser me;

  UserVerifyResponse(ZaimUser user, int responseRequested) {
    me = user;
    requested = responseRequested;
  }
}

class MoneyListResponse extends ResponseBase {
  List<ZaimMoney> money;

  MoneyListResponse(this.money, int responseRequested) {
    requested = responseRequested;
  }
}

class DeleteMoneyResponse extends ResponseBase {
  ZaimMoney money;
  ZaimUser user;

  DeleteMoneyResponse(this.money, this.user, int responseRequested) {
    requested = responseRequested;
  }
}

class CreateMoneyResponse extends ResponseBase {
  ZaimMoney money;
  ZaimUser user;
  ZaimPlace place;

  CreateMoneyResponse(
      {this.money, this.user, this.place, int responseRequested}) {
    requested = responseRequested;
  }
}

class UpdateMoneyResponse extends CreateMoneyResponse {
  UpdateMoneyResponse({money, user, place, responseRequested})
      : super(
            money: money,
            user: user,
            place: place,
            responseRequested: responseRequested);
}

class AccountsResponse extends ResponseBase {
  List<ZaimAccount> accounts;

  AccountsResponse(this.accounts, int responseRequested) {
    requested = responseRequested;
  }
}

class CategoriesResponse extends ResponseBase {
  List<ZaimCategory> categories;

  CategoriesResponse(this.categories, int responseRequested) {
    requested = responseRequested;
  }
}

class GenresResponse extends ResponseBase {
  List<ZaimGenre> genres;

  GenresResponse(this.genres, int responseRequested) {
    requested = responseRequested;
  }
}

class CurrenciesResponse extends ResponseBase {
  List<ZaimCurrency> currencies;

  CurrenciesResponse(this.currencies, int responseRequested) {
    requested = responseRequested;
  }
}
