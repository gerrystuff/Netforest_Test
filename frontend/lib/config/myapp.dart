import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:app/config/flavors.dart';

class MyApp {
  MyApp._();

  static final instance = MyApp._();
  final bool isProduction = const bool.fromEnvironment('dart.vm.product');

  late Start _start;

  Start get start => _start;

  set start(Start value) {
    _start = value;
  }

  List<Start> get regional => FlavorConfig.instance.isProd ? RegionalConfig(true).regional : RegionalConfig(false).regional;

  Future<void> startInit() async {
     start  = regional[0];
  }
}

Start startFromJson(Map<String, dynamic> json) {
  return Start(
    urlBackMobile: json['urlBackMobile'] as String?,
  );
}

class Start {
  Start({this.urlBackMobile});

  final String? urlBackMobile;

  Start copyWith({String? urlBackMobile}) => Start(
        urlBackMobile: urlBackMobile ?? this.urlBackMobile,
      );

  factory Start.fromJson(Map<String, dynamic> json) => Start(
        urlBackMobile: json['urlBackMobile'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'urlBackMobile': urlBackMobile,
      };
}


class RegionalConfig {
  final bool isProduction;

  RegionalConfig(this.isProduction);

  final regional = [
    Start(
      urlBackMobile: FlavorConfig.instance.appUrl,
    ),
  ];
}
