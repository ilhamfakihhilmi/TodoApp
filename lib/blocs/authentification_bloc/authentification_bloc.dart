import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthentificationBloc({
    required UserRepository myUserRepository,
  })  : userRepository = myUserRepository,
        super(AuthentificationState.unknown()) {
    _userSubscription = userRepository.user.listen((authUser) {
      add(AuthentificationChanged(authUser));
    });

    on<AuthentificationChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthentificationState.authenticated(event.user!));
      } else {
        emit(const AuthentificationState.unauthenticated());
      }
    });
  }
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
