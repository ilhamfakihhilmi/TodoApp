part of 'authentification_bloc.dart';

@immutable
abstract class AuthentificationEvent extends Equatable {
  const AuthentificationEvent();

  @override
  List<Object> get props => [];
}

class AuthentificationChanged extends AuthentificationEvent {
  const AuthentificationChanged(this.user);
  final User? user;

}

class AuthentificationLogoutRequested extends AuthentificationEvent{}
