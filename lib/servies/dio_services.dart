import 'package:dio/dio.dart';
import 'package:html/parser.dart';

class DioServices {
  var dio = Dio();
  final Map _webList = {};

  Future<Map> startScrapping(String url) async {
    var response = await dio.get(url);
    var htmlDocument = parse(response.data);
    var doc = htmlDocument.querySelectorAll("div.mt-3 > a");
    for (var value in doc) {
      _webList.addAll({value.text.trim(): "${value.attributes['href']}"});
    }
    return _webList;
  }
}
