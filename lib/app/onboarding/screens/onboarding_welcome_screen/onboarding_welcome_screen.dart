import 'package:basic/app/ecommerce/screens/ecommerce_main_screen/ecommerce_main_screen.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'onboarding_welcome_screen_controller.dart';
import 'onboarding_welcome_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class OnboardingWelcomeScreen
    extends BaseStatelessWidget<
        OnboardingWelcomeScreenController,
        OnboardingWelcomeScreenCubit,
        OnboardingWelcomeScreenState> {

  OnboardingWelcomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingWelcomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingWelcomeScreenCubit,
          OnboardingWelcomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              // padding: edge_insets_t_170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/welcome.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // padding: EdgeInsets.all(30.0),
              child: Container(
                  margin: edge_insets_16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlurryContainer(
                        blur: 3,
                        padding: edge_insets_0,
                        child: Container(
                          padding: edge_insets_x_16_y_24,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.center,
                                  colors: [
                                    AppColors.bgLightBlue,
                                    AppColors.white012,
                                    AppColors.white018
                                  ]),
                              border: borders.b_1px_bgLightBlue,
                              borderRadius: borderRadius.br_20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/flower-vas.png",
                                width: 80,
                                height: 80,
                              ),
                              Container(
                                padding: edge_insets_t_24,
                                child: const Text(
                                  "Ecommerce App",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: Fonts.fontSize24,
                                    fontWeight: Fonts.f700,
                                  ),
                                ),
                              ),
                              Container(
                                padding: edge_insets_t_8,
                                child: const Text(
                                  "Shop your favourites from here",
                                  style: TextStyle(
                                    color: AppColors.grey2,
                                    fontSize: Fonts.fontSize16,
                                    fontWeight: Fonts.f400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: edge_insets_t_56,
                                child: Row(
                                  children: [
                                    SizedBox(width: 24,),
                                    Expanded(child: ElevatedButton(
                                      // onHover: HSLColor.fromColor(Colors.black),
                                      style: ElevatedButton.styleFrom(
                                        // padding: edge_insets_x_49_y_12,
                                          backgroundColor: AppColors.white),
                                      onPressed: () async {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceMainScreen()));
                                      },
                                      child: const Text(
                                        "Enter",
                                        style: TextStyle(
                                          color: AppColors.bgPrimary,
                                          fontSize: Fonts.fontSize18,
                                          fontWeight: Fonts.f700,
                                        ),
                                      ),
                                    )),
                                    SizedBox(width: 24,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingWelcomeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingWelcomeScreenCubit cubit = OnboardingWelcomeScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
