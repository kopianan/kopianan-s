import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kopianan_s/injection.dart';
import 'package:kopianan_s/routes/kopi_route.dart';
import 'package:kopianan_s/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

//LazySingleton / singleton
@lazySingleton
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.initial());

  final _supabaseAuth = supabase.auth;
  StreamSubscription<AuthState>? _authStateSubscription;

  void initAuthentication() async {
    //pasang listener.
    _authStateSubscription?.cancel();
    _authStateSubscription = _supabaseAuth.onAuthStateChange.listen((event) {
      log(event.event.toString(), name: "EVENT");
     
      switch (event.event) {
        case AuthChangeEvent.passwordRecovery:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.signedIn:
          log("USER SIGN IN");
          getIt<KopiRoute>().replace(HomeRoute());
          break;
        case AuthChangeEvent.signedOut:
          log("USER SIGN OUT");
          getIt<KopiRoute>().replaceAll([LoginRoute()]);

          break;
        case AuthChangeEvent.tokenRefreshed:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userUpdated:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userDeleted:
          // TODO: Handle this case.
          break;
      }
    });
  }

  void singInWithEmailOnly(String email) async {
    try {
      await _supabaseAuth.signInWithOtp(
        email: email,
        emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
      );
    } on AuthException catch (error) {
      log(error.message);
    } catch (error) {
      log(error.toString());
    }
  }

  void checkAuthentication() async {
    initAuthentication();

    log("AUTHENTICATION CHECKED");
    await Future.delayed(const Duration(seconds: 3));

    final session = _supabaseAuth.currentSession;

    if (session != null) {
      getIt<KopiRoute>().replace(HomeRoute());
    } else {
      getIt<KopiRoute>().replace(LoginRoute());
    }
  }

  void logOutUser() async {
    await _supabaseAuth.signOut();
  }
}
