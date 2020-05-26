part of dart_zaim_client;

const String ZAIM_API_BASE_URL = 'https://api.zaim.net';

class ZaimClient {
  oauth1.Client _client;
  oauth1.ClientCredentials _clientCredentials;

  ZaimClient(ZaimConfig config, oauth1.Credentials credentials) {
    _clientCredentials =
        oauth1.ClientCredentials(config.consumerId, config.consumerSecret);
    _client = oauth1.Client(
        oauth1.SignatureMethods.hmacSha1, _clientCredentials, credentials);
  }

  Future<UserVerifyResponse> userVerify() async {
    final response = await _requestParse('/v2/home/user/verify');
    final int requested = response['requested'];
    return UserVerifyResponse(ZaimUser(response['me']), requested);
  }

  Future<MoneyListResponse> getMoneyList() async {
    List<ZaimMoney> moneyList = [];
    final response = await _requestParse('/v2/home/money');
    for (var data in response['money']) {
      moneyList.add(ZaimMoney(data));
    }
    final int requested = response['requested'];
    return MoneyListResponse(moneyList, requested);
  }

  Future<CreateMoneyResponse> createMoney(
      ZaimMoneyType moneyType, MoneyRequestParameter paramsObj) async {
    String moneyTypeString = ZaimMoneyTypeHelper.name(moneyType);
    Map<String, String> params = paramsObj.toRequestBody();
    final response = await _client.post(
        '$ZAIM_API_BASE_URL/v2/home/money/$moneyTypeString',
        body: params);
    var jsonArray = jsonDecode(response.body);
    if (jsonArray['error'] == true) {
      throw new ZaimError(response.statusCode, jsonArray['message']);
    }

    var money = ZaimMoney(jsonArray['money']);
    var user = ZaimUser(jsonArray['user']);
    ZaimPlace place;
    if (jsonArray['place'] != null) {
      place = ZaimPlace(jsonArray['place']);
    } else {
      place = null;
    }
    final int requested = jsonArray['requested'];
    return CreateMoneyResponse(
        money: money, user: user, place: place, responseRequested: requested);
  }

  Future<UpdateMoneyResponse> updateMoney(
      ZaimMoneyType moneyType, int id, MoneyRequestParameter paramsObj) async {
    String moneyTypeString = ZaimMoneyTypeHelper.name(moneyType);
    Map<String, String> params = paramsObj.toRequestBody();
    final response = await _client.put(
        '$ZAIM_API_BASE_URL/v2/home/money/$moneyTypeString/$id',
        body: params);
    var jsonArray = jsonDecode(response.body);
    if (jsonArray['error'] == true) {
      throw new ZaimError(response.statusCode, jsonArray['message']);
    }

    var money = ZaimMoney(jsonArray['money']);
    var user = ZaimUser(jsonArray['user']);
    ZaimPlace place;
    if (jsonArray['place'] != null) {
      place = ZaimPlace(jsonArray['place']);
    } else {
      place = null;
    }
    final int requested = jsonArray['requested'];
    return UpdateMoneyResponse(
        money: money, user: user, place: place, responseRequested: requested);
  }

  Future<DeleteMoneyResponse> deleteMoney(
      ZaimMoneyType moneyType, int id) async {
    String moneyTypeString = ZaimMoneyTypeHelper.name(moneyType);
    final response = await _client
        .delete('$ZAIM_API_BASE_URL/v2/home/money/$moneyTypeString/$id');
    var jsonArray = jsonDecode(response.body);
    if (jsonArray['error'] == true) {
      throw new ZaimError(response.statusCode, jsonArray['message']);
    }
    var money = ZaimMoney(jsonArray['money']);
    var user = ZaimUser(jsonArray['user']);
    final int requested = jsonArray['requested'];
    return DeleteMoneyResponse(money, user, requested);
  }

  Future<CategoriesResponse> getCategories() async {
    List<ZaimCategory> categoriesList = [];
    var response = await _requestParse('/v2/home/category');
    for (var data in response['categories']) {
      categoriesList.add(ZaimCategory(data));
    }
    final int requested = response['requested'];
    return CategoriesResponse(categoriesList, requested);
  }

  Future<CategoriesResponse> getDefaultCategories() async {
    List<ZaimCategory> categoriesList = [];
    var response = await _requestParse('/v2/category');
    for (var data in response['categories']) {
      categoriesList.add(ZaimCategory(data));
    }
    final int requested = response['requested'];
    return CategoriesResponse(categoriesList, requested);
  }

  Future<GenresResponse> getGenres() async {
    List<ZaimGenre> genresList = [];
    var response = await _requestParse('/v2/home/genre');
    for (var data in response['genres']) {
      genresList.add(ZaimGenre(data));
    }
    final int requested = response['requested'];
    return GenresResponse(genresList, requested);
  }

  Future<GenresResponse> getDefaultGenres() async {
    List<ZaimGenre> genresList = [];
    var response = await _requestParse('/v2/genre');
    for (var data in response['genres']) {
      genresList.add(ZaimGenre(data));
    }
    final int requested = response['requested'];
    return GenresResponse(genresList, requested);
  }

  Future<AccountsResponse> getAccounts() async {
    List<ZaimAccount> accountsList = [];
    var response = await _requestParse('/v2/home/account');
    for (var data in response['accounts']) {
      accountsList.add(ZaimAccount(data));
    }
    final int requested = response['requested'];
    return AccountsResponse(accountsList, requested);
  }

  Future<AccountsResponse> getDefaultAccounts() async {
    List<ZaimAccount> accountsList = [];
    var response = await _requestParse('/v2/account');
    for (var data in response['accounts']) {
      accountsList.add(ZaimAccount(data));
    }
    final int requested = response['requested'];
    return AccountsResponse(accountsList, requested);
  }

  Future<CurrenciesResponse> getCurrencies() async {
    List<ZaimCurrency> currenciesList = [];
    var response = await _requestParse('/v2/currency');
    for (var data in response['currencies']) {
      currenciesList.add(ZaimCurrency(data));
    }
    final int requested = response['requested'];
    return CurrenciesResponse(currenciesList, requested);
  }

  Future<Map<String, dynamic>> _requestParse(String apiPath) async {
    final response = await _client.get('$ZAIM_API_BASE_URL$apiPath');
    var body = jsonDecode(response.body);
    if (body['error'] == true) {
      throw new ZaimError(response.statusCode, body['message']);
    }
    return jsonDecode(response.body);
  }
}
