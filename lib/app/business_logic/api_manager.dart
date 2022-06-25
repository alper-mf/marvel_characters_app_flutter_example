import 'package:dop_flutter_base_project/app/constants/app/app_constant.dart';
import 'package:dop_flutter_base_project/app/constants/app/http_url.dart';
import 'package:dop_flutter_base_project/app/constants/enum/general_enum.dart';
import 'package:dop_flutter_base_project/app/constants/enum/loading_status_enum.dart';
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

  ///Marvel karakter listesini getirir.
  Future<BaseHttpModel<CharactersResponseModel>> getCharacterLists(
      Map<String, dynamic> param) async {
    final Map<String, dynamic> defaultParams = {
      "apikey": AppConstants().publicKey ?? '',
      "hash": AppConstants().hash ?? '',
      "ts": 1
    };

    if (param.isNotEmpty) {
      defaultParams.addAll(param);
    }
    try {
      var response = await HttpClient().request(HttpMethod.get, HttpUrl.characters,
          headerParam: createHeader(),
          bodyParam: defaultParams,
          pathBody: HttpUrl()
              .pathBody(apiKey: AppConstants().publicKey ?? '', hash: AppConstants().hash ?? ''));

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await CharactersResponseModel().jsonParser(response.body);
        return BaseHttpModel<CharactersResponseModel>(
            status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.unauthorized) {
        print('UNHATHORIZED');
        return BaseHttpModel(status: BaseModelStatus.error);
      } else {
        // ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.message);
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }
}
