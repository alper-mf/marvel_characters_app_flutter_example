class HttpUrl {
  /// Api Url
  static late final String baseUrl;

  ///Development tarafında kullanılan baseURL.
  static const developmentBaseUrl = 'gateway.marvel.com';

  ///Product tarafında kullanılan baseURL.
  static const productBaseUrl = 'gateway.marvel.com:443';

  ///Stagging tarafında kullanılan baseURL.
  static const staggingBaseUrl = 'gateway.marvel.com';

  ///Path de kullanılacak method.
  String pathBody({required String apiKey, required String hash}) =>
      'apikey=$apiKey&ts=1&hash=$hash';

  /// --> v1/public/characters
  static const characters = 'v1/public/characters';

  /// GET (for get new token)
  static const String getToken = '';
}
