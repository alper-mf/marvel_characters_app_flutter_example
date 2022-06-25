import 'package:dop_flutter_base_project/app/constants/enum/loading_status_enum.dart';

class BaseHttpModel<T> {
  BaseModelStatus status;
  T? data;
  String? message;
  String? errorCode;

  BaseHttpModel({required this.status, this.data, this.message, this.errorCode});
}
