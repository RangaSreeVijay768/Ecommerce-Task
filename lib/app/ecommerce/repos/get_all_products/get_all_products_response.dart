import 'package:basic/app/ecommerce/models/products_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllProductsResponse extends ProductsModel{

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsResponseToJson(this);

  GetAllProductsResponse();
}
