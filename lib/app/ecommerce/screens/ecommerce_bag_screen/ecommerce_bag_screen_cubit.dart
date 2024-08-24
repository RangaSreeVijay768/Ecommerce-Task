import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_bag_screen_state.dart';

part 'ecommerce_bag_screen_cubit.freezed.dart';

class EcommerceBagScreenCubit extends BaseCubit<EcommerceBagScreenState> {
  EcommerceBagScreenCubit({required super.context})
      : super(initialState: EcommerceBagScreenState.initial());
}
