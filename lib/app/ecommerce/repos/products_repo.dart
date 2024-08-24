import 'package:basic/app/ecommerce/repos/get_all_products/get_all_products_request.dart';
import 'package:basic/app/ecommerce/repos/get_all_products/get_all_products_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../core/network/dio_client.dart';


part 'products_repo.g.dart';


@RestApi()
abstract class ProductsRestClient {
  factory ProductsRestClient(Dio dio, {String baseUrl}) = _ProductsRestClient;

  @GET("/products")
  Future<GetAllProductsResponse> getAllProducts(@Queries() Map<String, dynamic> queryMap);

}


@singleton
class ProductsRepo extends RestService {
  late ProductsRestClient productsRestClient;

  ProductsRepo() : super() {
    this.productsRestClient = ProductsRestClient(getDioClient(), baseUrl: "https://dummyjson.com");
  }

  Future<GetAllProductsResponse> getAllProducts(GetAllProductsRequest request) {
    return productsRestClient.getAllProducts(request.toJson());
  }

}
