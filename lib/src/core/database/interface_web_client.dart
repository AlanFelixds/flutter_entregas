import 'dart:io';

abstract class IWebClient {
  void clientConfiguration() {}
  Future<dynamic> post({required String url, required Map body}) async {}
  Future<dynamic> get({required String url}) async {}
}
