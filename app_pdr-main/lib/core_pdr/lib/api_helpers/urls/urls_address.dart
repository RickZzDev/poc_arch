abstract class AppUrl {
  late final String _baseUrl;
  String baseUrlWithEndpoint(String endpoint);
}

class AppDevUrl implements AppUrl {
  AppDevUrl() {
    _baseUrl = "devUrl.com";
  }
  String getBaseUrlWithEndpoint(String endpoint) =>
      baseUrlWithEndpoint(endpoint);

  @override
  String baseUrlWithEndpoint(String endpoint) {
    return "$_baseUrl/$endpoint";
  }

  @override
  late final String _baseUrl;

  @override
  set _baseUrl(String __baseUrl) {
    _baseUrl = __baseUrl;
  }
}

class AppProdUrl implements AppUrl {
  AppProdUrl() {
    _baseUrl = "prodUrl.com";
  }
  String getBaseUrlWithEndpoint(String endpoint) =>
      baseUrlWithEndpoint(endpoint);

  @override
  String baseUrlWithEndpoint(String endpoint) {
    return "$_baseUrl/$endpoint";
  }

  @override
  late final String _baseUrl;

  @override
  set _baseUrl(String __baseUrl) {
    _baseUrl = __baseUrl;
  }
}
