import 'package:get/get.dart';
import 'arabic.dart';
import 'english.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {"ar": ar, "en": en};
}
