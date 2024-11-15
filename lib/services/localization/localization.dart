import 'package:bellaryapp/models/lanugage.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/storage/local_storage.dart';
import 'package:dio/dio.dart';

class Localization {
  Map<String, dynamic> headers = {
    "x-rapidapi-ua": "RapidAPI-Playground",
    "x-rapidapi-key": "57f7041992msh997f3d866da91e2p1cd374jsn9b22fb032db0",
    //"x-rapidapi-key": "739ebabb46msh41b4cba4d468bcap1f8919jsndeec1ddec708",
    //"x-rapidapi-key": "b2f433a8e4mshb66f5c2fb095d2fp19e2a3jsnd585a4263418",
    "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
  };
  String url = 'https://deep-translate1.p.rapidapi.com/language/translate/v2';

  Map<String, dynamic> body(String q) {
    Language? language = authProvider.user?.profile?.language;
    return {"q": q, "source": "en", "target": language?.code};
  }

  Future<String> translate(String value) async {
    String translatedText = '';
    if (value.isEmpty) return '';
    Language? language = authProvider.user?.profile?.language;
    if (language == null || language.code == 'en') return value;
    String local = await LocalStorage.getString('${language.code}$value') ?? '';
    translatedText = local;
    if (translatedText.isNotEmpty) return translatedText;
    Response response = await Dio()
        .post(url, data: body(value), options: Options(headers: headers));
    Map data = response.data['data'] ?? {};
    Map translations = data['translations'] ?? {};
    translatedText = translations['translatedText'] ?? '';
    LocalStorage.setString(
        '${authProvider.user?.profile?.language?.code}$value', translatedText);
    return translatedText;
    // if (mounted) setState(() {});
  }
}
