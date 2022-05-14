import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2445637094519371~3740483003";
    }  else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2445637094519371/9539604594";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}