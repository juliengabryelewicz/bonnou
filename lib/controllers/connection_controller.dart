import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bonnou/controllers/rss_controller.dart';

class ConnectionController extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;

  final Connectivity _connectivity = Connectivity();
  final RssController _rssController = Get.put(RssController());

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        _rssController.getAllNews();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        _rssController.getAllNews();
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        Get.snackbar("Attention", "Pas de connexion Internet. Vous n'aurez pas accès aux articles");
        break;
      default:
        Get.snackbar("Erreur", "Impossible de définir votre connexion Internet");
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}