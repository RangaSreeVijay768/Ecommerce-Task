import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/fonts.dart';
import 'ecommerce_bag_screen_controller.dart';
import 'ecommerce_bag_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceBagScreen
    extends BaseStatelessWidget<
        EcommerceBagScreenController,
        EcommerceBagScreenCubit,
        EcommerceBagScreenState> {

  EcommerceBagScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceBagScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceBagScreenCubit, EcommerceBagScreenState>(
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
                Text("Bag will be displayed here",style: TextStyle(
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
  EcommerceBagScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceBagScreenCubit cubit = EcommerceBagScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
