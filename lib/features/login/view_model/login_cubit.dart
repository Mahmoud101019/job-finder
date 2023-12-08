// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:job_finder_app/core/database/remoteDatabase/endpoints.dart';
import '../model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isChecked = false;
  bool obscure = true;

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.PostData(
      url: login,
      data: {
        'email': email,
        "password": password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);

      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void changeCheckBox(checked) {
    isChecked = checked;
    emit(ChangeRememberState());
  }

  void changeIcon() {
    obscure = !obscure;
    print(obscure);
    emit(ChangeIconState());
  }
}
