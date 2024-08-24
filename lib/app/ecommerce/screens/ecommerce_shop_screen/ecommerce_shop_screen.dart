import 'package:basic/app/ecommerce/widgets/ecommerce_get_all_products_widget/ecommerce_get_all_products_widget.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ecommerce_shop_screen_controller.dart';
import 'ecommerce_shop_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceShopScreen
    extends BaseStatelessWidget<
        EcommerceShopScreenController,
        EcommerceShopScreenCubit,
        EcommerceShopScreenState> {

  EcommerceShopScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceShopScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceShopScreenCubit, EcommerceShopScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Stack(
              alignment: Alignment.topLeft,
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: edge_insets_16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100,),
                        EcommerceGetAllProductsWidget()
                      ],
                    ),
                  ),
                ),
                Container(
                    color: AppColors.white,
                    height: 100,
                    padding: edge_insets_x_16,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 26,),
                        Container(
                          margin: edge_insets_l_6,
                          child: Text("Products", style: TextStyle(
                              fontSize: Fonts.fontSize32,
                              fontWeight: Fonts.f700
                          ),),
                        ),
                        Container(
                          padding: edge_insets_t_2,
                          margin: edge_insets_l_6,
                          child: Text('Super summer sale', style: TextStyle(
                              fontWeight: Fonts.f400,
                              fontSize: Fonts.fontSize11
                          ),),
                        ),
                      ],
                    )
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceShopScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceShopScreenCubit cubit = EcommerceShopScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
