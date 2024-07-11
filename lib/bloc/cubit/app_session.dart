import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/session_manager.dart';

class AppSessionCubit extends Cubit<AppSessionState> {
  final SessionManager sessionManager = SessionManager();

  AppSessionCubit() : super(AppSessionInitial()) {
    checkSession();
  }

  void checkSession() {
    sessionManager.isActiveSession()
        ? emit(AppSessionAuthenticated())
        : emit(AppSessionUnAuthenticated());
  }
}

@immutable
sealed class AppSessionState {}

final class AppSessionInitial extends AppSessionState {}

final class AppSessionAuthenticated extends AppSessionState {}

final class AppSessionUnAuthenticated extends AppSessionState {}
