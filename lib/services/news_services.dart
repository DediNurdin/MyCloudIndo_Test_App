import 'package:dio/dio.dart';

import '../constants/constants.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ApiUrls.baseUrl, responseType: ResponseType.json),
  );

  fetchNews() async {
    var response = await _dio.get(
      'v2/top-headlines?country=us&apiKey=094abddfda1944fb87d868677f3005ee',
    );

    return response.data;
  }
}
