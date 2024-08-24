import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/fonts.dart';
import 'ecommerce_favourites_screen_controller.dart';
import 'ecommerce_favourites_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceFavouritesScreen
    extends BaseStatelessWidget<
        EcommerceFavouritesScreenController,
        EcommerceFavouritesScreenCubit,
        EcommerceFavouritesScreenState> {

  EcommerceFavouritesScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceFavouritesScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceFavouritesScreenCubit,
          EcommerceFavouritesScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/construction.png", height: 100, width: 100, fit: BoxFit.fill,),
                SizedBox(height: 10,),
                Text("Your favourites will be displayed here",style: TextStyle(
                    fontSize: Fonts.fontSize14
                ),),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceFavouritesScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceFavouritesScreenCubit cubit = EcommerceFavouritesScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
