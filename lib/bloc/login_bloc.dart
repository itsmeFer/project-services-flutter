import 'package:app_car/api/exception.dart';
import 'package:app_car/api/response.dart';
import 'package:app_car/api/response_data/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/params/login_params.dart';
import '../api/users.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UsersApi usersApi = UsersApi();

  LoginBloc() : super(LoginInitial()) {
    on<LoginPressed>(_onLoginPressed);
    on<LoginReset>(_onLoginReset);
  }

  void _onLoginPressed(LoginPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      ApiResponse<LoginData> response =
          await usersApi.login(params: event.params);
      emit(LoginSuccess(response: response));
    } on ApiException catch (e) {
      emit(LoginError(message: e.toString(), code: e.code));
    } catch (e) {
      emit(LoginFatalError(message: e.toString()));
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }
}

// LoginEvent
@immutable
sealed class LoginEvent {}

final class LoginPressed extends LoginEvent {
  final LoginParams params;
  LoginPressed({required this.params});
}

final class LoginReset extends LoginEvent {}

// LoginState
@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final ApiResponse<LoginData> response;
  LoginSuccess({required this.response});
}

final class LoginError extends LoginState {
  final String? message;
  final int? code;
  LoginError({required this.message, required this.code});
}

final class LoginFatalError extends LoginState {
  final String? message;
  LoginFatalError({required this.message});
}
