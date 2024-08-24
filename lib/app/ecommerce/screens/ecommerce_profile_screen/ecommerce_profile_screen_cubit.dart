import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_profile_screen_state.dart';

part 'ecommerce_profile_screen_cubit.freezed.dart';

class EcommerceProfileScreenCubit
    extends BaseCubit<EcommerceProfileScreenState> {
  EcommerceProfileScreenCubit({required super.context})
      : super(initialState: EcommerceProfileScreenState.initial());
}
