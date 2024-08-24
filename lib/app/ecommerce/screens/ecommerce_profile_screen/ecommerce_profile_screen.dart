import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/fonts.dart';
import 'ecommerce_profile_screen_controller.dart';
import 'ecommerce_profile_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceProfileScreen
    extends BaseStatelessWidget<
        EcommerceProfileScreenController,
        EcommerceProfileScreenCubit,
        EcommerceProfileScreenState> {

  EcommerceProfileScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceProfileScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceProfileScreenCubit,
          EcommerceProfileScreenState>(
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
                Text("Profile will be displayed here",style: TextStyle(
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
  EcommerceProfileScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceProfileScreenCubit cubit = EcommerceProfileScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
