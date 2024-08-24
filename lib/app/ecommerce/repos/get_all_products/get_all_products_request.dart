import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAllProductsRequest {

  factory GetAllProductsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsRequestToJson(this);

  GetAllProductsRequest();
}
