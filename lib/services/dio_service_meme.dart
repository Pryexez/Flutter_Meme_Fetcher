import 'package:dio/dio.dart';
import '../models/MemeResponse.dart';

class MemesApiServices {
  String apiKey = "";
  late final String _url = "https://meme-api.com/gimme/";

  late Dio _dio;

  MemesApiServices() {
    _dio = Dio(BaseOptions(baseUrl: _url));
  }

  Future<String> fetchMeme(String endPoint) async {
    try {
      Response response = await _dio.get(endPoint);
      Meme meme = Meme.fromJson(response.data);
      return meme.preview[2];
    } on DioError catch (e) {
      throw (e);
    }
  }
}
