part of 'authentification_bloc.dart';

enum AuthentificationStatus { authentificated, unauthentificated, unknown }

class AuthentificationState extends Equatable {
  final AuthentificationStatus status;
  final User? user;

  const AuthentificationState._({
    this.status = AuthentificationStatus.unknown,
    this.user,
  });

  const AuthentificationState.unknown() : this._();

  //current user authentificated
  const AuthentificationState.authenticated(User user)
      : this._(
          status: AuthentificationStatus.authentificated,
        );
  //current user authentificated
  const AuthentificationState.unauthenticated()
      : this._(
          status: AuthentificationStatus.unauthentificated,
        );

  @override
  List<Object?> get props => [status, user];
}
