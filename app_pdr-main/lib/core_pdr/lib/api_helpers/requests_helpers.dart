import 'package:api_helper/api_helper.dart';
import 'package:core_pdr/api_helpers/headers/header_utils.dart';

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
