part of dart_zaim_client;

const String ZAIM_API_BASE_URL = 'https://api.zaim.net';

class ZaimClient {
  oauth1.Client _client;
  oauth1.ClientCredentials _clientCredentials;

  ZaimClient(ZaimConfig config, oauth1.Credentials credentials) {
    _clientCredentials =
        new oauth1.ClientCredentials(config.consumerId, config.consumerSecret);
    _client = oauth1.Client(
        oauth1.SignatureMethods.hmacSha1, _clientCredentials, credentials);
  }

  Future<ZaimUser> userVerify() async {
    final response = await _requestParse('/v2/home/user/verify');
    return ZaimUser(response['me']);
  }

  Future<List<ZaimMoney>> getMoneyList() async {
    List<ZaimMoney> moneyList = [];
    final response = await _client.get('$ZAIM_API_BASE_URL/v2/home/money');
    var jsonArray = jsonDecode(response.body);
    for (var data in jsonArray['money']) {
      moneyList.add(ZaimMoney(data));
    }
    return moneyList;
  }

  Future<CreateMoneyResponse> createMoney(
      ZaimMoneyType moneyType, MoneyRequestParameter paramsObj) async {
    String moneyTypeString = ZaimMoneyTypeHelper.name(moneyType);
    Map<String, String> params = paramsObj.toRequestBody();
    final response = await _client.post(
        '$ZAIM_API_BASE_URL/v2/home/money/$moneyTypeString',
        body: params);
    var jsonArray = jsonDecode(response.body);
    var money = ZaimMoney(jsonArray['money']);
    var user = ZaimUser(jsonArray['user']);
    ZaimPlace place;
    if (jsonArray['place'] != null) {
      place = ZaimPlace(jsonArray['place']);
    } else {
      place = null;
    }
    return CreateMoneyResponse(money: money, user: user, place: place);
  }

  Future<CreateMoneyResponse> updateMoney(
      ZaimMoneyType moneyType, int id, MoneyRequestParameter paramsObj) async {
    String moneyTypeString = ZaimMoneyTypeHelper.name(moneyType);
    Map<String, String> params = paramsObj.toRequestBody();
    final response = await _client.put(
        '$ZAIM_API_BASE_URL/v2/home/money/$moneyTypeString/$id',
        body: params);
    var jsonArray = jsonDecode(response.body);
    var money = ZaimMoney(jsonArray['money']);
    var user = ZaimUser(jsonArray['user']);
    ZaimPlace place;
    if (jsonArray['place'] != null) {
      place = ZaimPlace(jsonArray['place']);
    } else {
      place = null;
    }
    return CreateMoneyResponse(money: money, user: user, place: place);
  }

  Future<MoneyResponse> deleteMoney(ZaimMoneyType moneyType, int id) async {
    String moneyTypeString = ZaimMoneyTypeHelper.name(moneyType);
    final response = await _client
        .delete('$ZAIM_API_BASE_URL/v2/home/money/$moneyTypeString/$id');
    var jsonArray = jsonDecode(response.body);
    var money = ZaimMoney(jsonArray['money']);
    var user = ZaimUser(jsonArray['user']);
    return MoneyResponse(money: money, user: user);
  }

  Future<List<ZaimCategory>> getCategories() async {
    List<ZaimCategory> categoriesList = [];
    final response = await _client.get('$ZAIM_API_BASE_URL/v2/home/category');
    var jsonArray = jsonDecode(response.body);
    for (var data in jsonArray['categories']) {
      categoriesList.add(ZaimCategory(data));
    }
    return categoriesList;
  }

  Future<List<ZaimCategory>> getDefaultCategories() async {
    List<ZaimCategory> categoriesList = [];
    final response = await _client.get('$ZAIM_API_BASE_URL/v2/category');
    var jsonArray = jsonDecode(response.body);
    for (var data in jsonArray['categories']) {
      categoriesList.add(ZaimCategory(data));
    }
    return categoriesList;
  }

  Future<List<ZaimGenre>> getGenres() async {
    List<ZaimGenre> genresList = [];
    final response = await _client.get('$ZAIM_API_BASE_URL/v2/home/genre');
    var jsonArray = jsonDecode(response.body);
    for (var data in jsonArray['genres']) {
      genresList.add(ZaimGenre(data));
    }
    return genresList;
  }

  Future<List<ZaimGenre>> getDefaultGenres() async {
    List<ZaimGenre> genresList = [];
    final response = await _client.get('$ZAIM_API_BASE_URL/v2/genre');
    var jsonArray = jsonDecode(response.body);
    for (var data in jsonArray['genres']) {
      genresList.add(ZaimGenre(data));
    }
    return genresList;
  }

  Future<List<ZaimAccount>> getAccounts() async {
    List<ZaimAccount> accountsList = [];
    var response = await _requestParse('/v2/home/account');
    for (var data in response['accounts']) {
      accountsList.add(ZaimAccount(data));
    }
    return accountsList;
  }

  Future<List<ZaimAccount>> getDefaultAccounts() async {
    List<ZaimAccount> accountsList = [];
    var response = await _requestParse('/v2/account');
    for (var data in response['accounts']) {
      accountsList.add(ZaimAccount(data));
    }
    return accountsList;
  }

  Future<List<ZaimCurrency>> getCurrencies() async {
    List<ZaimCurrency> currenciesList = [];
    var response = await _requestParse('/v2/currency');
    for (var data in response['currencies']) {
      currenciesList.add(ZaimCurrency(data));
    }
    return currenciesList;
  }

  Future<Map<String, dynamic>> _requestParse(String apiPath) async {
    final response = await _client.get('$ZAIM_API_BASE_URL$apiPath');
    return jsonDecode(response.body);
  }
}
