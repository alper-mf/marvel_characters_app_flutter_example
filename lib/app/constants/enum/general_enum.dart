///Flavor işlemlerinde kullanılmakta.
enum AppEnvironment {
  Development,
  Staging,
  Production,
}

///Loading işlemlerinde kullanılmakta.
enum LoadingStatus { init, loading, loaded, error }

/// Http işlemlerinde kullanılmakta.
enum HttpMethod { get, post, put, delete, update }
