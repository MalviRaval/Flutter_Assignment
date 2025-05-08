import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_6/bloc/auth/auth_event.dart';
import 'package:module_6/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated(message: "Registration successful"));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated(message: "Login successful"));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
  
    on<LogoutEvent>((event, emit) async {
      await _auth.signOut();
      emit(Unauthenticated());
    });
  }
}
