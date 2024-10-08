import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kltn_mobile/screens/Authentication/auth_data_notify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kltn_mobile/blocs/repository/repository.dart';
import 'package:kltn_mobile/models/user_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final APIRepository _apiRepository;
  late SharedPreferences logindata;
  UserAuthLogin? userAuthLogin;

  LoginCubit(this._apiRepository)
      : super(LoginCheckSessionState(isLoggedIn: false)) {
    checkLoginStatus();
  }

  Future<UserAuthLogin?> checkLoginStatus() async {
    logindata = await SharedPreferences.getInstance();
    final userString = logindata.getString('user');
    final token = logindata.getString('token');
    final isRemember = logindata.getBool('isRememberChange') ?? false;
    print('checkLoginStatus called');
    print('userString: $userString');
    print('token: $token');
    print('isRemember: $isRemember');
    if (token != null && isRemember && userString != null) {
      userAuthLogin = UserAuthLogin.fromJson(jsonDecode(userString));
      emit(LoginCheckSessionState(isLoggedIn: true, token: token));
    } else if (token != null && isRemember) {
      final email = logindata.getString('email');
      final password = logindata.getString('password');
      print('check email $email, password $password');
      if (email != null && password != null) {
        print('Attempting to login with saved credentials');
        await login(email, password, isRemember);
      } else {
        print('Email or password is null');
      }
    } else {
      userAuthLogin = null;
      await logindata.remove('user'); // Xóa dữ liệu user nếu không có token
      emit(LoginCheckSessionState(isLoggedIn: false));
    }
    return userAuthLogin;
  }

  Future<void> autoLogin() async {
    final email = logindata.getString('email');
    final password = logindata.getString('password');
    final isRemember = logindata.getBool('isRememberChange') ?? false;

    if (email != null && password != null) {
      print('Attempting to auto-login with saved credentials');
      await login(email, password, isRemember);
    } else {
      print('Email or password is null for auto-login');
    }
  }

  Future<void> login(
      String email, String password, bool isRememberChange) async {
    emit(LoginLoading());
    try {
      UserAuthLogin? userAuthLogin =
          await _apiRepository.login(email, password);
      if (userAuthLogin != null && userAuthLogin.error == null) {
        this.userAuthLogin = userAuthLogin;
        logindata = await SharedPreferences.getInstance();
        // Check if token is empty and generate a random token if necessary
        if (userAuthLogin.token.isEmpty) {
          userAuthLogin.token = _generateRandomToken();
          print('Generated random token: ${userAuthLogin.token}');
        } else {
          print('Received token: ${userAuthLogin.token}');
        }
        if (isRememberChange) {
          await logindata.setString('token', userAuthLogin.token); // Lưu token
          await logindata.setString('email', email); // Lưu email
          await logindata.setString('password', password); // Lưu password
          await logindata.setBool('isRememberChange', isRememberChange);
          print('Token saved: ${userAuthLogin.token}');
          print('Email saved: $email');
          print('Password saved: $password');
          print('isRememberChange saved: $isRememberChange');
        }
        await logindata.setString(
            'user', jsonEncode(userAuthLogin.toJson())); // Lưu userAuthLogin
        print('User saved: ${jsonEncode(userAuthLogin.toJson())}');

        emit(LoginSuccess(userAuthLogin));
      } else {
        final errorLogin = userAuthLogin?.error ?? 'Error';
        emit(LoginFailure(errorLogin));
        print('Check Error Login $errorLogin');
      }
    } catch (e) {
      final userString = logindata.getString('user');
      final token = logindata.getString('token');
      final isRemember = logindata.getBool('isRememberChange') ?? false;
      print('Exception occurred while logging in: $e');
      print('Current userString: $userString');
      print('Current token: $token');
      print('Current isRemember: $isRemember');

      emit(LoginFailure(e.toString()));
    }
  }

  String _generateRandomToken() {
    const length = 32;
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
        .join();
  }

  Future<void> logout(BuildContext context) async {
    logindata = await SharedPreferences.getInstance();
    await logindata.remove('token');
    await logindata.remove('user');
    await logindata.remove('isRememberChange');
    // ignore: use_build_context_synchronously
    context.read<UserAuthProvider>().setUserAuthLogin(null);
    print(userAuthLogin);
    emit(LoginInitial());
  }

  void checkEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(email)) {
      emit(EmailError('Vui lòng nhập đúng định dạng email'));
    } else {
      emit(LoginInitial());
    }
  }
}
