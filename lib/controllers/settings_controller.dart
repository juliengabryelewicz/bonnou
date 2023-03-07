
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage();
  final String _stopwordsKey = "stopwords";
  var stopwords = 'stopwords'.obs;

  @override
  void onInit() {
    super.onInit();
    readStopwords();
  }

  void readStopwords() {
    final stopwordsValue = _storage.read(_stopwordsKey) ?? "";
    stopwords.value = stopwordsValue;
  }

  void saveStopwords(String stopwordsValue) {
    _storage.write(_stopwordsKey, stopwordsValue);
    readStopwords();
  }

}