import 'package:get/get.dart';

extension GetXExtension on GetInterface {
  S? canFind<S>({String? tag}) {
    try {
      return GetInstance().find<S>(tag: tag);
    } on String {
      return null;
    }
  }
}
