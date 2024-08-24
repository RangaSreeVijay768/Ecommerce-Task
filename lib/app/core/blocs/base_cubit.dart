import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../widgets/core_toast_success/core_toast_success.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BuildContext context;
  FToast? fToast;

  BaseCubit({required this.context, required State initialState})
      : super(initialState) {
    // firebaseAnalyticsService = GetIt.instance<FirebaseAnalyticsService>();
  }

  emitState(State state) {
    emit(state);
  }

  showErrorMessage(String message) {
    showMessage(message, Icons.close, Colors.redAccent);
  }

  showSuccessMessage(String message){
    showMessage(message, Icons.check, Colors.greenAccent);
  }

  showMessage(String message, IconData icon, MaterialAccentColor? color) {
    if (fToast == null) {
      fToast = FToast();
      fToast!.init(context);
    }
    fToast!.showToast(
        child: CoreToastSuccess(
          message: message,
          color: color,
          icon: icon,
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2));
  }
}

