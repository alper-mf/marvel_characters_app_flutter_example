/// [LoadingStatus] state management te kullanılan yüklenme durumları.
/// [ApiStatus] Api den gelen status durumları.
/// [BaseModelStatus] BL katmanı ile Controleller katmanı arasındaki (HttpStatus) API Durumlarını 'dır.
enum LoadingStatus { init, loading, loaded, error }

enum BaseModelStatus { ok, error, action, unprocessableEntity, timeOut, notFound, found }
