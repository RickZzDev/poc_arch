import 'package:core_pdr/api_helpers/headers/header_utils.dart';

import 'api_implementation.dart';

class CoreRequester {
  static DioRequester requester = DioRequester();

  Future fetch(String url,
      {Map<String, dynamic>? header, Map<String, dynamic>? body}) async {
    try {
      await requester.fetch(url, header ?? HeaderUtils.defaultHeader());
    } catch (e) {
      rethrow;
    }
  }
}
