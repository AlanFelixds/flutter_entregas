abstract class IWebClient {
  void clientConfiguration() async {}
  Future<dynamic> post({required String url, required Map body}) async {}
  Future<dynamic> get({required String url}) async {}
}
