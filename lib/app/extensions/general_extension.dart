import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

extension GetXExtension on GetInterface {
  S? canFind<S>({String? tag}) {
    try {
      return GetInstance().find<S>(tag: tag);
    } on String {
      return null;
    }
  }
}

extension StringExtension on String {
  String converToMd5() {
    return md5.convert(utf8.encode(this)).toString();
  }
}
