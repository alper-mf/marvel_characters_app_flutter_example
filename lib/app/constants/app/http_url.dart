class HttpUrl {
  /// Api Url
  static late final String baseUrl;

  ///Development tarafında kullanılan baseURL.
  static const developmentBaseUrl = 'gateway.marvel.com';

  ///Product tarafında kullanılan baseURL.
  static const productBaseUrl = 'gateway.marvel.com';

  ///Stagging tarafında kullanılan baseURL.
  static const staggingBaseUrl = 'gateway.marvel.com';

  ///Path de kullanılacak method.
  String pathBody({required String apiKey, required String hash}) =>
      'apikey=$apiKey&ts=${DateTime.now()}&hash=$hash';

  /// --> v1/public/characters (Karakter listesini getirir.)
  static const characters = 'v1/public/characters';

  /// --> /v1/public/characters/{characterId}/ (Karakter detayını getirir.)
  String characterDetail({required int characterId}) => 'v1/public/characters/$characterId';

  /// --> /v1/public/characters/{characterId}/comics (Karaktere ait comics bookslar getirir.)
  String characterComics({required int characterId}) => 'v1/public/characters/$characterId/comics';

  /// GET (for get new token)
  static const String getToken = '';
}
