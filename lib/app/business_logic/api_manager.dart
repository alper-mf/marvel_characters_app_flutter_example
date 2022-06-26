import 'package:dop_flutter_base_project/app/constants/app/app_constant.dart';
import 'package:dop_flutter_base_project/app/constants/app/http_url.dart';
import 'package:dop_flutter_base_project/app/constants/enum/general_enum.dart';
import 'package:dop_flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:dop_flutter_base_project/app/extensions/general_extension.dart';
import 'package:dop_flutter_base_project/app/model/base_http_model.dart';
import 'package:dop_flutter_base_project/app/model/response/characters_response.dart';
import 'package:dop_flutter_base_project/core/exception/http_error_exception.dart';
import 'package:dop_flutter_base_project/core/services/http_client.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../controllers/general/session_service.dart';
import '../model/header/session_header_model.dart';

/// Tüm modüllerde kullanılan Http işlemleri buradan yapılmaktadır.
///
class ApiManager extends SessionHeaderModel {
  ApiManager() : super(token: Get.find<SessionService>().getUserToken() ?? '');

  final hash = ("1${AppConstants().privateKey}${AppConstants().publicKey}").convertToMd5;
  final Map<String, dynamic> defaultParams = {
    "apikey": "${AppConstants().publicKey}",
    "hash": "${AppConstants().hash}",
    "ts": "1"
  };

  ///Marvel karakter listesini getirir.
  Future<BaseHttpModel<CharactersResponseModel>> getCharacterList(
      [Map<String, dynamic>? param]) async {
    final Map<String, dynamic> defaultParams = {
      "apikey": "${AppConstants().publicKey}",
      "hash": "${AppConstants().hash}",
      "ts": "1"
    };

    if (param != null && param.isNotEmpty) {
      defaultParams.addAll(param);
    }
    try {
      var response = await HttpClient().request(HttpMethod.get, HttpUrl.characters,
          headerParam: createHeader(), bodyParam: defaultParams);

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await CharactersResponseModel().backgroundJsonParser(response.body);
        return BaseHttpModel<CharactersResponseModel>(
            status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        return BaseHttpModel(status: BaseModelStatus.notFound);
      } else {
        //ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  ///Marvel karakterine ait detayları çeker.
  Future<BaseHttpModel<CharactersResponseModel>> getCharacterDetail(int characterId) async {
    try {
      var response = await HttpClient().request(
          HttpMethod.get, HttpUrl().characterDetail(characterId: characterId),
          headerParam: createHeader(), bodyParam: defaultParams);

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await CharactersResponseModel().backgroundJsonParser(response.body);
        return BaseHttpModel<CharactersResponseModel>(
            status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        return BaseHttpModel(status: BaseModelStatus.notFound);
      } else {
        //ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  ///Marvel karakterine ait romanlar çekilir.
  Future<BaseHttpModel<CharactersResponseModel>> getCharacterComics(int characterId) async {
    try {
      var response = await HttpClient().request(
          HttpMethod.get, HttpUrl().characterComics(characterId: characterId),
          headerParam: createHeader(), bodyParam: defaultParams);

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await CharactersResponseModel().backgroundJsonParser(response.body);
        return BaseHttpModel<CharactersResponseModel>(
            status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        return BaseHttpModel(status: BaseModelStatus.notFound);
      } else {
        //ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }
}
