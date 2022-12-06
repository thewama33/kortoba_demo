
import 'package:dio/dio.dart';

import '../../services/network/network_manager.dart';

abstract class BaseRepo {
  CancelToken? cancelToken;
  late NetworkManager networkManager;


  BaseRepo() {
    cancelToken = CancelToken();
    networkManager = NetworkManager(cancelToken: cancelToken);
  }

  void dispose() {
    cancelToken!.cancel();
  }
}