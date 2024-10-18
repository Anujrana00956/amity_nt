// import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  static ValueNotifier<bool> isConnected = ValueNotifier(false);

  static init() {
    Connectivity().onConnectivityChanged.listen((event) {
      isConnected.value = _getStatusFromResult(event);
    });
  }

  // Convert from the third part enum to our own enum
  static bool _getStatusFromResult(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none) && result.length == 1) {
      return false;
    } else {
      return true;
    }
  }
}
