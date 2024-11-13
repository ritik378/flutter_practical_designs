import 'package:designs/common/languages/LanguageString.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => translations;

  Map<String, Map<String, String>> translations = {
    'en_US': {
      LanguageString.hello: 'Hello',
      LanguageString.welcome: 'Welcome to GetX',
       LanguageString.login : 'Log In',
      LanguageString.signup: 'Sign Up',
      LanguageString.forgot: 'Forgot Password',
    },
  };

  // // Method to load translations
  // Future<void> loadTranslations() async {
  //   translations['en'] = await _loadJson('assets/locals/en.json');
  //   translations['ur'] = await _loadJson('assets/locals/ur.json');
  // }
  //
  // // Helper method to load and decode JSON files
  // Future<Map<String, String>> _loadJson(String path) async {
  //   final jsonString = await rootBundle.loadString(path);
  //   final Map<String, dynamic> jsonMap = json.decode(jsonString);
  //   return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  // }
}
