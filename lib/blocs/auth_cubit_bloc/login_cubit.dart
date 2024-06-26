import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kltn_mobile/blocs/repository/repository.dart';
import 'package:kltn_mobile/models/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final APIRepository _apiRepository;
  late SharedPreferences logindata;
  late UserAuthLogin userAuthLogin;
  LoginCubit(this._apiRepository) : super(LoginInitial());

  void checkEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(email)) {
      print("Email checked");
      emit(EmailError('Vui lòng nhập đúng định dạng email'));
    } else {
      emit(LoginInitial());
    }
  }

  Future<void> login(
      String email, String password, bool isRememberChange) async {
    print(isRememberChange);
    emit(LoginLoading());
    try {
      UserAuthLogin? userAuthLogin =
          await _apiRepository.login(email, password);
      if (userAuthLogin != null && userAuthLogin.error == null) {
        this.userAuthLogin = userAuthLogin;
        if (isRememberChange) {
          final logindata = await SharedPreferences.getInstance();
          await logindata.setString('user', jsonEncode(userAuthLogin.toJson()));
          await logindata.setBool('isRememberChange', isRememberChange);
        } else {
          final logindata = await SharedPreferences.getInstance();
          await logindata.setString('user', jsonEncode(userAuthLogin.toJson()));
        }
        emit(LoginSuccess(userAuthLogin));
        emit(LoginInitial());
      } else if (userAuthLogin?.error != null) {
        emit(LoginFailure(userAuthLogin?.error ?? 'Failed to login'));
        LoginInitial();
      }else {
        emit(LoginFailure('Failed to login'));
        LoginInitial();
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
      LoginInitial();
    }
  }

  Future<void> logout() async {
    final logindata = await SharedPreferences.getInstance();
    await logindata.remove('user');
    await logindata.remove('isRememberChange');
    emit(LoginInitial());
  }
}
