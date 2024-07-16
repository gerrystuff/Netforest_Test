import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:package_info/package_info.dart';

bool kIsDev = false;
bool kIsQA = false;

abstract class FlavorKeys {
  static const appUrl = 'app_url';
  static const appHTTPHeaders = 'app_http_headers';
}

extension FlavorConfigExtention on FlavorConfig {
  bool get isDev  => name!.contains("DEVELOP");
  bool get isProd => name!.contains("PRODUCTION");

  String get appUrl => variables[FlavorKeys.appUrl];
  Map<String, dynamic> get httpHeaders =>
      variables[FlavorKeys.appHTTPHeaders];
}

void setFlavorMX(String version)  {
  if(kIsDev) {
    FlavorConfig(
        name: "DEVELOP",
        location: BannerLocation.bottomStart,
        variables: {
          FlavorKeys.appUrl: 'http://192.168.100.60:3000',
          FlavorKeys.appHTTPHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer token'
          }
        });
  } else if (kIsQA) {
    FlavorConfig(name: "QA", location: BannerLocation.bottomStart, variables: {
      FlavorKeys.appUrl: 'http://192.168.100.60:3000',
      FlavorKeys.appHTTPHeaders: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer token'
      }
    });
  } else {
    FlavorConfig(
      name: "PRODUCTION",
      location: BannerLocation.bottomStart,
      variables: {
        FlavorKeys.appUrl: 'http://192.168.100.60:3000',
        FlavorKeys.appHTTPHeaders: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer token'
        }
      }
    );
  }
}

Future<void> setFlavor() async {
  var version = '';
  try {
    version = (await PackageInfo.fromPlatform()).version;
  } catch (e) {
    version = '1.0.1';
  }

  setFlavorMX(version);
}
