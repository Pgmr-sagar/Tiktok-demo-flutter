import 'package:tiktok_demo/utility/constants.dart';

enum ApiUrl { completeUrl, baseUrl }

extension ApiUrlString on ApiUrl {
  String get string {
    switch (this) {
      case ApiUrl.completeUrl:
        return Constants.completeUrl;
      case ApiUrl.baseUrl:
        return Constants.emptyString;
    }
  }
}
