import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  Future<Either<String, AuthResponseModel>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        if (googleSignInAuthentication.idToken != null) {
          return Left(" BERHASIL ${googleSignInAuthentication.idToken!}");
        } else {
          // ID token is null, handle this case appropriately
          return Left(" GAGAL ");
        }
      }
      return Left(" ADA ISI ");
    } catch (error) {
      return Left("$error}");
    }
    // final googleUser = await _googleSignIn.signIn();
    // if (googleUser == null) {
    //   return const Left('Failed to sign in by Google');
    // }

    // final googleAuth = await googleUser.authentication;
    // print('Access Token: ${googleAuth.accessToken}');
    // print('ID Token: ${googleAuth.idToken}');

    // if (googleAuth.idToken == null) {
    //   return const Left('Failed to retrieve ID token');
    // }

    // return Left(" BERHASIL ${googleAuth.idToken!}");
  }
}
