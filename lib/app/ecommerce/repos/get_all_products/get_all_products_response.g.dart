// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProductsResponse()
      ..products = (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = json['total'] as int?
      ..skip = json['skip'] as int?
      ..limit = json['limit'] as int?;

Map<String, dynamic> _$GetAllProductsResponseToJson(
        GetAllProductsResponse instance) =>
    <String, dynamic>{
      'products': instance.products?.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
