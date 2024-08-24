import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../models/products_model.dart';
import 'ecommerce_product_details_screen_controller.dart';
import 'ecommerce_product_details_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceProductDetailsScreen extends BaseStatelessWidget<
    EcommerceProductDetailsScreenController,
    EcommerceProductDetailsScreenCubit,
    EcommerceProductDetailsScreenState> {
  final Products product;
  ScrollController scrollController = ScrollController();
  EcommerceProductDetailsScreen(
      {super.key,
      super.controller,
      super.onStateChanged,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceProductDetailsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceProductDetailsScreenCubit,
          EcommerceProductDetailsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.chevron_left)),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: Text(
                      product.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: false,
                      style: TextStyle(
                          fontWeight: Fonts.f900, fontSize: Fonts.fontSize18),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share))
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height / 1.6,
                        child: product.images!.length > 1
                            ? Scrollbar(
                          controller: scrollController,
                          thumbVisibility: true,
                            thickness: 5,
                            radius: Radius.circular(4),
                            trackVisibility: false,
                            child: ListView.builder(
                              controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: product.images!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: edge_insets_r_4,
                                    color: AppColors.grey2,
                                    child: Image.network(
                                      product.images![index],
                                      fit: BoxFit.fill,
                                      width: MediaQuery.sizeOf(context).width /
                                          1.3,
                                      height:
                                      MediaQuery.sizeOf(context).height /
                                          1.6,
                                    ),
                                  );
                                })
                        )
                            : Container(
                                color: AppColors.grey2,
                                child: Image.network(
                                  product.thumbnail!,
                                  fit: BoxFit.fill,
                                  width: MediaQuery.sizeOf(context).width,
                                  height:
                                      MediaQuery.sizeOf(context).height / 1.6,
                                ),
                              ),
                      ),
                      Container(
                        margin: edge_insets_16,
                        decoration: BoxDecoration(
                            boxShadow: [shadows.bs_primary],
                            borderRadius: borderRadius.br_100),
                        child: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.white,
                            ),
                            icon: Icon(
                              Icons.favorite_border,
                              color: AppColors.grey1,
                              size: 20,
                            )),
                      )
                    ],
                  ),
                  Container(
                    padding: edge_insets_t_16,
                    margin: edge_insets_x_16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( product.brand != null ?
                          product.brand.toString() : product.title.toString(),
                          style: TextStyle(
                              fontSize: Fonts.fontSize24, fontWeight: Fonts.f900),
                        ),
                        Text(
                          "${getCubit(context).price(product.price!, product.discountPercentage!).toStringAsFixed(2)}\$",
                          style: TextStyle(
                              fontSize: Fonts.fontSize24, fontWeight: Fonts.f900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: edge_insets_x_16,
                    child: Text(product.category.toString(),style: TextStyle(
                      fontSize: Fonts.fontSize11,
                      color: AppColors.grey1
                    ),),
                  ),
                  Container(
                    margin: edge_insets_t_10,
                    padding: edge_insets_x_16,
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(5, (index) {
                            if (index < product.rating!.floor()) {
                              return Icon(Icons.star, color: Colors.yellow);
                            } else if (index < product.rating!) {
                              return Icon(Icons.star_half, color: Colors.yellow);
                            } else {
                              return Icon(Icons.star_border, color: Colors.grey);
                            }
                          }),
                        ),
                        SizedBox(width: 10,),
                        Text("(${product.rating})")
                      ],
                    ),
                  ),
                  Container(
                    margin: edge_insets_t_24,
                    padding: edge_insets_x_16,
                    child: Text(product.description.toString(), style: TextStyle(
                      fontSize: Fonts.fontSize14
                    ),),
                  ),
                  Container(
                    margin: edge_insets_t_16,
                    decoration: BoxDecoration(
                      border: borders.b_1px_grey2
                    ),
                  ),
                  Container(
                    margin: edge_insets_t_16,
                    padding: edge_insets_x_16,
                    child: Text(product.returnPolicy.toString(), style: TextStyle(
                      fontSize: Fonts.fontSize14,
                      fontWeight: Fonts.f500
                    ),),
                  ),
                  Container(
                    margin: edge_insets_t_16,
                    decoration: BoxDecoration(
                        border: borders.b_1px_grey2
                    ),
                  ),
                  Container(
                    margin: edge_insets_t_16,
                    padding: edge_insets_x_16,
                    child: Text("Customers top reviews", style: TextStyle(
                      fontSize: Fonts.fontSize16,
                      fontWeight: Fonts.f600,
                    ),),
                  ),
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: product.reviews!.length,
                        itemBuilder: (context, index){
                        final review = product.reviews![index];
                          return Container(
                            padding: edge_insets_t_12,
                            margin: edge_insets_x_16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person, size: 18,),
                                    SizedBox(width: 10,),
                                    Text(review.reviewerName.toString(), style: TextStyle(
                                      fontSize: Fonts.fontSize14
                                    ),)
                                  ],
                                ),
                                Container(
                                  margin: edge_insets_t_4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(5, (index) {
                                      if (index < review.rating!.floor()) {
                                        return Icon(Icons.star, color: Colors.yellow);
                                      } else if (index < review.rating!) {
                                        return Icon(Icons.star_half, color: Colors.yellow);
                                      } else {
                                        return Icon(Icons.star_border, color: Colors.grey);
                                      }
                                    }),
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(review.comment.toString(), style: TextStyle(
                                  fontSize: Fonts.fontSize14,
                                  fontWeight: Fonts.f600
                                ),),
                                SizedBox(height: 4,),
                                Text("Reviewed on ${review.date}", style: TextStyle(
                                  fontSize: Fonts.fontSize11
                                ),)
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: edge_insets_y_20,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [shadows.bs_grey]
              ),
              child: Row(
                children: [
                  SizedBox(width: 16,),
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.bgPrimary,
                          padding: edge_insets_y_16
                        ),
                        onPressed: (){},
                        child: Text("ADD TO CART", style: TextStyle(
                          fontSize: Fonts.fontSize14,
                          fontWeight: Fonts.f500,
                          color: AppColors.white
                        ),),
                      )
                  ),
                  SizedBox(width: 16,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceProductDetailsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceProductDetailsScreenCubit cubit =
        EcommerceProductDetailsScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
