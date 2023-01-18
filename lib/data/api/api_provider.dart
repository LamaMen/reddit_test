import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reddit_test/data/api/api_client.dart';

@singleton
class ApiProvider {
  ApiProvider(@Named('BaseUrl') this.baseUrl);

  final String baseUrl;

  final _options = BaseOptions();

  ApiClient getApi() {
    final dio = Dio(_options);
    return ApiClient(dio, baseUrl: baseUrl);
  }
}

@module
abstract class ServerAddressModule {
  @Named('BaseUrl')
  String get baseUrlTest => 'https://reddit.com';
}
