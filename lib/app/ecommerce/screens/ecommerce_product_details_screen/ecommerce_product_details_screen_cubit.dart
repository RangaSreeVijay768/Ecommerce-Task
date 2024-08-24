import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_product_details_screen_state.dart';

part 'ecommerce_product_details_screen_cubit.freezed.dart';

class EcommerceProductDetailsScreenCubit
    extends BaseCubit<EcommerceProductDetailsScreenState> {
  EcommerceProductDetailsScreenCubit({required super.context})
      : super(initialState: EcommerceProductDetailsScreenState.initial());

  double calculateDiscountedPrice(double originalPrice, double discountPercentage) {
    return originalPrice * (1 - (discountPercentage / 100));
  }

  double price(double originalPrice, double discountPercentage) {
    return calculateDiscountedPrice(originalPrice, discountPercentage);
  }

}
