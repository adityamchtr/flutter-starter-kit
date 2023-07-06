import 'package:get/get.dart';

class Language extends Translations {

  @override
  Map<String, Map<String, String>> get keys {
    return {
      "en_US": enLanguage,
      "id_ID": idLanguage,
    };
  }

  Map<String, String> get enLanguage {
    return {

      //main
      "home": "Home",
      "pick": "Pick",
      "news": "News",
      "plan": "Plan",
      "account": "Account",
    };
  }

  Map<String, String> get idLanguage {
    return {

      //main
      "home": "Beranda",
      "pick": "Pick",
      "news": "Berita",
      "plan": "Rencana",
      "account": "Akun",
    };
  }

}