import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/exception.dart';
import '../api/params/register_params.dart';
import '../api/response.dart';
import '../api/users.dart';
import '../api/response_data/register.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UsersApi usersApi = UsersApi();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterPressed>(_onRegisterPressed);
    on<RegisterReset>(_onRegisterReset);
  }

  void _onRegisterPressed(
      RegisterPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      ApiResponse<RegisterData> response =
          await usersApi.register(params: event.params);
      emit(RegisterSuccess(response: response));
    } on ApiException catch (e) {
      emit(RegisterError(message: e.toString(), code: e.code));
    } catch (e) {
      emit(RegisterFatalError(message: e.toString()));
    }
  }

  void _onRegisterReset(RegisterReset event, Emitter<RegisterState> emit) {
    emit(RegisterInitial());
  }
}

// RegisterEvent
@immutable
sealed class RegisterEvent {}

final class RegisterPressed extends RegisterEvent {
  final RegisterParams params;
  RegisterPressed({required this.params});
}

final class RegisterReset extends RegisterEvent {}

// RegisterState
@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final ApiResponse<RegisterData> response;
  RegisterSuccess({required this.response});
}

final class RegisterError extends RegisterState {
  final String? message;
  final int? code;
  RegisterError({this.message, this.code});
}

final class RegisterFatalError extends RegisterState {
  final String? message;
  RegisterFatalError({this.message});
}
