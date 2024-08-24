import 'package:basic/app/ecommerce/screens/ecommerce_bag_screen/ecommerce_bag_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_favourites_screen/ecommerce_favourites_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_home_screen/ecommerce_home_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_profile_screen/ecommerce_profile_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_shop_screen/ecommerce_shop_screen.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'ecommerce_main_screen_controller.dart';
import 'ecommerce_main_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceMainScreen
    extends BaseStatelessWidget<
        EcommerceMainScreenController,
        EcommerceMainScreenCubit,
        EcommerceMainScreenState> {

  EcommerceMainScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key) {
    tabWidgets = {
      'HOME': EcommerceHomeScreen(),
      'SHOP': EcommerceShopScreen(),
      'BAG': EcommerceBagScreen(),
      'FAVOURITES': EcommerceFavouritesScreen(),
      'PROFILE': EcommerceProfileScreen(),
    };
  }
  late final Map<String, Widget> tabWidgets;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceMainScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceMainScreenCubit, EcommerceMainScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: tabWidgets[state.selectedWidgetName],
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: AppColors.white, boxShadow: [shadows.bs_primary]),
              alignment: Alignment.center,
              height: 80,
              padding: edge_insets_x_7,
              child: Row(
                children: [
                  Expanded(child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('HOME');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: edge_insets_13,
                            child: Icon(
                              state.selectedWidgetName == 'HOME'?
                              Icons.home : Icons.home_outlined,
                              color: state.selectedWidgetName == 'HOME'
                                  ? AppColors.bgPrimary
                                  : AppColors.grey4,
                            ),
                          ),
                          Text("Home", style: TextStyle(
                              color: state.selectedWidgetName == 'HOME'
                                  ? AppColors.bgPrimary : AppColors.grey1,
                              fontSize: Fonts.fontSize10,
                              fontWeight: Fonts.f400
                          ),)
                        ],
                      ))),
                  Expanded(child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('SHOP');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: edge_insets_13,
                            child: Icon(
                              state.selectedWidgetName == 'SHOP'?
                              Icons.shopping_cart : Icons.shopping_cart_outlined,
                              color: state.selectedWidgetName == 'SHOP'
                                  ? AppColors.bgPrimary
                                  : AppColors.grey4,
                            ),
                          ),
                          Text("Shop", style: TextStyle(
                              color: state.selectedWidgetName == 'SHOP'
                                  ? AppColors.bgPrimary : AppColors.grey1,
                              fontSize: Fonts.fontSize10,
                              fontWeight: Fonts.f400
                          ),)
                        ],
                      ))),
                  Expanded(child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('BAG');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: edge_insets_13,
                            child: Icon(
                              state.selectedWidgetName == 'BAG'?
                              Icons.shopping_bag : Icons.shopping_bag_outlined,
                              color: state.selectedWidgetName == 'BAG'
                                  ? AppColors.bgPrimary
                                  : AppColors.grey4,
                            ),
                          ),
                          Text("Bag", style: TextStyle(
                              color: state.selectedWidgetName == 'BAG'
                                  ? AppColors.bgPrimary : AppColors.grey1,
                              fontSize: Fonts.fontSize10,
                              fontWeight: Fonts.f400
                          ),)
                        ],
                      ))),
                  Expanded(child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('FAVOURITES');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: edge_insets_13,
                            child: Icon(
                              state.selectedWidgetName == 'FAVOURITES'?
                              Icons.favorite : Icons.favorite_border,
                              color: state.selectedWidgetName == 'FAVOURITES'
                                  ? AppColors.bgPrimary
                                  : AppColors.grey4,
                            ),
                          ),
                          Text("Favourites", style: TextStyle(
                              color: state.selectedWidgetName == 'FAVOURITES'
                                  ? AppColors.bgPrimary : AppColors.grey1,
                              fontSize: Fonts.fontSize10,
                              fontWeight: Fonts.f400
                          ),)
                        ],
                      ))),
                  Expanded(child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('PROFILE');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: edge_insets_13,
                            child: Icon(
                              state.selectedWidgetName == 'PROFILE'?
                              Icons.person : Icons.person_2_outlined,
                              color: state.selectedWidgetName == 'PROFILE'
                                  ? AppColors.bgPrimary
                                  : AppColors.grey4,
                            ),
                          ),
                          Text("Profile", style: TextStyle(
                              color: state.selectedWidgetName == 'PROFILE'
                                  ? AppColors.bgPrimary : AppColors.grey1,
                              fontSize: Fonts.fontSize10,
                              fontWeight: Fonts.f400
                          ),)
                        ],
                      ))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceMainScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceMainScreenCubit cubit = EcommerceMainScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
