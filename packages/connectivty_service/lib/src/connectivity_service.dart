import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:synchronized/synchronized.dart';

class ConnectivityService {
  static late StreamSubscription<ConnectivityResult> _subscription;
  static final _controller = BehaviorSubject<bool>.seeded(true);
  static bool _isInited = false;
  static var _first = true;
  // bool isConnected = true;
  static Lock lock = Lock();

  Stream<bool> get connectionStream => _controller.stream;

  ConnectivityService() {
    _checkConnectivity();
    if (_isInited) return;
    initConnectivity();
  }

  static void cancel() {
    _subscription.cancel();
  }

  Future<void> initConnectivity() async {
    _isInited = true;
    _subscription = Connectivity().onConnectivityChanged.listen(listener);
    await _checkConnectivity();
  }

  bool get isConnected => _controller.value;

  Future<void> _checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (!_controller.value) {
          _controller.add(true);
        }
      }
    } on SocketException catch (_) {
      _controller.add(false);
    }
  }

  // static final _debouncer = CallbackDebouncer(200.milliseconds);
  Future<void> listener(ConnectivityResult event) async {
    log(event.toString());
    if (_first) {
      _first = false;
      return;
    }
    lock.synchronized(_checkConnectivity);
  }
}
