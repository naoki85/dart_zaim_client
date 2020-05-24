part of dart_zaim_client;

const String ZAIM_API_URL_REQUEST_TOKEN =
    'https://api.zaim.net/v2/auth/request';
const String ZAIM_API_URL_AUTHORIZE = 'https://auth.zaim.net/users/auth';
const String ZAIM_API_URL_ACCESS_TOKEN = 'https://api.zaim.net/v2/auth/access';

class ZaimAuthorization {
  oauth1.Authorization _auth;
  oauth1.ClientCredentials _clientCredentials;
  oauth1.Credentials _tempCredentials;

  final _platform = oauth1.Platform(
      ZAIM_API_URL_REQUEST_TOKEN,
      ZAIM_API_URL_AUTHORIZE,
      ZAIM_API_URL_ACCESS_TOKEN,
      oauth1.SignatureMethods.hmacSha1);

  ZaimAuthorization(ZaimConfig config) {
    _clientCredentials =
        oauth1.ClientCredentials(config.consumerId, config.consumerSecret);
    _auth = oauth1.Authorization(_clientCredentials, _platform);
  }

  get clientCredentials => _clientCredentials;
  get platform => _platform;

  Future<String> getRequestTokenUrl(String callbackUri) async {
    final response = await _auth.requestTemporaryCredentials(callbackUri);
    _tempCredentials = response.credentials;
    return "${_auth.getResourceOwnerAuthorizationURI(_tempCredentials.token)}";
  }

  Future<oauth1.Credentials> requestToken(String verifier) async {
    final response =
        await _auth.requestTokenCredentials(_tempCredentials, verifier);
    _tempCredentials = null;

    return response.credentials;
  }
}
