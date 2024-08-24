import 'package:basic/app/ecommerce/screens/ecommerce_favourites_screen/ecommerce_favourites_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_product_details_screen/ecommerce_product_details_screen.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'ecommerce_get_all_products_widget_controller.dart';
import 'ecommerce_get_all_products_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceGetAllProductsWidget extends BaseStatelessWidget<
    EcommerceGetAllProductsWidgetController,
    EcommerceGetAllProductsWidgetCubit,
    EcommerceGetAllProductsWidgetState> {
  EcommerceGetAllProductsWidget(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceGetAllProductsWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceGetAllProductsWidgetCubit,
          EcommerceGetAllProductsWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return state.getAllProductsResponse != null
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.getAllProductsResponse!.products!.length,
                  itemBuilder: (context, index) {
                    final product =
                        state.getAllProductsResponse!.products![index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceProductDetailsScreen(
                          product: product,
                        )));
                      },
                      child: Container(
                        margin: edge_insets_t_16,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [shadows.bs_primary],
                            borderRadius: borderRadius.br_10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: borderRadius.br_l_10,
                                  child: Image.network(
                                    product.thumbnail.toString(),
                                    width: MediaQuery.sizeOf(context).width / 2.3,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  margin: edge_insets_10,
                                  padding: edge_insets_5,
                                  decoration: BoxDecoration(
                                      color: AppColors.textRed,
                                      borderRadius: borderRadius.br_30),
                                  child: Text(
                                    "-${product.discountPercentage!.toStringAsFixed(0)}%",
                                    style: TextStyle(
                                        fontSize: Fonts.fontSize10,
                                        fontWeight: Fonts.f900,
                                        color: AppColors.white),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: edge_insets_r_24,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(5, (index) {
                                          if (index < product.rating!.floor()) {
                                            return Icon(Icons.star, color: Colors.yellow);
                                          } else if (index < product.rating!) {
                                            return Icon(Icons.star_half, color: Colors.yellow);
                                          } else {
                                            return Icon(Icons.star_border, color: Colors.yellow);
                                          }
                                        }),
                                      ),
                                      Text(
                                        "(${product.rating})",
                                        style: TextStyle(
                                            fontSize: Fonts.fontSize10,
                                            color: AppColors.grey1),
                                      )
                                    ],
                                  ),
                                  Text( product.brand != null ?
                                    product.brand.toString() : product.category.toString(),
                                    style: TextStyle(
                                        fontSize: Fonts.fontSize11,
                                        color: AppColors.grey1),
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width / 2.6,
                                    child: Text(
                                      product.title.toString(),
                                      maxLines: 1,
                                      softWrap: false,
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Fonts.fontSize16,
                                        fontWeight: Fonts.f900,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${product.price}\$",
                                        style: TextStyle(
                                            fontWeight: Fonts.f500,
                                            fontSize: Fonts.fontSize14,
                                            color: AppColors.grey1,
                                            decoration:
                                            TextDecoration.lineThrough),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${getCubit(context).price(product.price!, product.discountPercentage!).toStringAsFixed(2)}\$",
                                        style: TextStyle(
                                            fontWeight: Fonts.f500,
                                            color: AppColors.textRed,
                                            fontSize: Fonts.fontSize14),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Center(
              child: Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width/1.5,
                margin: edge_insets_t_170,
                decoration: BoxDecoration(
                    boxShadow: const [shadows.bs_primary],
                    color: AppColors.white,
                    borderRadius: borderRadius.br_10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                        color: AppColors.bgPrimary,
                        size: 50,
                        secondRingColor: AppColors.bmiTracker,
                        thirdRingColor: AppColors.waterPrimary),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Loading \n Please wait",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: Fonts.f500,
                          fontSize: Fonts.fontSize18),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  EcommerceGetAllProductsWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceGetAllProductsWidgetCubit cubit =
        EcommerceGetAllProductsWidgetCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
