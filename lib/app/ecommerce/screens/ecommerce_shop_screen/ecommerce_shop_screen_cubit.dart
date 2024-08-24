import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_shop_screen_state.dart';

part 'ecommerce_shop_screen_cubit.freezed.dart';

class EcommerceShopScreenCubit extends BaseCubit<EcommerceShopScreenState> {
  EcommerceShopScreenCubit({required super.context})
      : super(initialState: EcommerceShopScreenState.initial());
}
