
import 'package:flutter_application_cat_fact/models/cat.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'cat_api.g.dart';

@RestApi(baseUrl: "https://cataas.com")
abstract class CatClient {
  factory CatClient(Dio dio, {String baseUrl}) = _CatClient;

  @GET("/cat?json=true")
  Future<Cat> getCat();
}

