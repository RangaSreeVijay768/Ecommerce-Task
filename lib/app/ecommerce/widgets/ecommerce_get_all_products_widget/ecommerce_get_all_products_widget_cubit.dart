import 'package:basic/app/ecommerce/repos/get_all_products/get_all_products_request.dart';
import 'package:basic/app/ecommerce/repos/get_all_products/get_all_products_response.dart';
import 'package:basic/app/ecommerce/repos/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

import '../../../core/database/boolean_status.dart';

part 'ecommerce_get_all_products_widget_state.dart';

part 'ecommerce_get_all_products_widget_cubit.freezed.dart';

class EcommerceGetAllProductsWidgetCubit
    extends BaseCubit<EcommerceGetAllProductsWidgetState> {
  late ProductsRepo productsRepo;
  EcommerceGetAllProductsWidgetCubit({required super.context})
      : super(initialState: EcommerceGetAllProductsWidgetState.initial()){
    productsRepo=GetIt.instance<ProductsRepo>();
    getAllProducts(createRequestData());
  }

    GetAllProductsRequest createRequestData() {
        final request = GetAllProductsRequest();
        return request;
      }

    Future<GetAllProductsResponse> getAllProducts(
          GetAllProductsRequest request) async {
        return productsRepo.getAllProducts(request).then((value) {
          emit(state.copyWith(
              getAllProductsResponse: value,
              getAllProductsStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllProductsStatus: BooleanStatus.error));
          throw error;
        });
      }


  double calculateDiscountedPrice(double originalPrice, double discountPercentage) {
    return originalPrice * (1 - (discountPercentage / 100));
  }

  double price(double originalPrice, double discountPercentage) {
    return calculateDiscountedPrice(originalPrice, discountPercentage);
  }


}
