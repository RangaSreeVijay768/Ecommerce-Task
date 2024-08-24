import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsModel({this.products, this.total, this.skip, this.limit});

    factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

      Map<String, dynamic> toJson() => _$ProductsModelToJson(this);


  // ProductsModel.fromJson(Map<String, dynamic> json) {
  //   if (json['products'] != null) {
  //     products = <Products>[];
  //     json['products'].forEach((v) {
  //       products!.add(new Products.fromJson(v));
  //     });
  //   }
  //   total = json['total'];
  //   skip = json['skip'];
  //   limit = json['limit'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.products != null) {
  //     data['products'] = this.products!.map((v) => v.toJson()).toList();
  //   }
  //   data['total'] = this.total;
  //   data['skip'] = this.skip;
  //   data['limit'] = this.limit;
  //   return data;
  // }
}

@JsonSerializable()
class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.dimensions,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail});

    factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

      Map<String, dynamic> toJson() => _$ProductsToJson(this);

}

@JsonSerializable()
class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

    factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);

      Map<String, dynamic> toJson() => _$DimensionsToJson(this);

}

@JsonSerializable()
class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

    factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);

      Map<String, dynamic> toJson() => _$ReviewsToJson(this);

}

@JsonSerializable()
class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

      Map<String, dynamic> toJson() => _$MetaToJson(this);

}
