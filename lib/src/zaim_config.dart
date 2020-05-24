part of dart_zaim_client;

class ZaimConfig {
  String _consumerId;
  String _consumerSecret;

  ZaimConfig(consumerId, consumerSecret) {
    this._consumerId = consumerId;
    this._consumerSecret = consumerSecret;
  }

  get consumerId => _consumerId;
  get consumerSecret => _consumerSecret;
}
