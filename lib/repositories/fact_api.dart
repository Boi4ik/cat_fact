import 'package:dio/dio.dart';
import 'package:flutter_application_cat_fact/models/fact.dart';
import 'package:retrofit/retrofit.dart';


part 'fact_api.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com")
abstract class FactClient {
  factory FactClient(Dio dio, {String baseUrl}) = _FactClient;

  @GET("/facts/random?animal_type=cat&amount=1")
  Future<Fact> getFact();
}


