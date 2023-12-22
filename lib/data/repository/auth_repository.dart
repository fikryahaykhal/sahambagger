import 'package:dartz/dartz.dart';
import 'package:main/core/failure.dart';
import 'package:main/domain/repository/auth_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, bool>> doLogin(
      String username, String password) async {
    try {
      final user = ParseUser(username, password, null);
      final response = await user.login();

      if (!response.success) {
        return left(Failure(response.error?.message));
      }

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> doGoogleLogin() async {
    try {
      const List<String> scopes = <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];

      final googleSignIn = GoogleSignIn(
        scopes: scopes,
      );

      final account = await googleSignIn.signIn();
      final auth = await account?.authentication;

      final user = googleSignIn.currentUser;

      final accessToken = auth?.accessToken;
      final userId = user?.id;
      final idToken = auth?.idToken;

      if (accessToken == null && userId == null && idToken == null) {
        return left(const Failure('Tidak dapat melakukan autentikasi'));
      } else {
        final response = await ParseUser.loginWith(
          'google',
          google(
            accessToken!,
            userId!,
            idToken!,
          ),
        );

        if (!response.success) {
          return left(Failure(response.error?.message));
        }

        return right(true);
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
