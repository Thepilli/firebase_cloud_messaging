class TExceptions implements Exception {
  final String message;
  const TExceptions([this.message = 'An unknown error occurred']);

  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Emait already exists. ');
      case 'invalid-email':
        return const TExceptions('Emait is not valid or badly formatted. ');
      case 'weak-password':
        return const TExceptions('P1ease enter a stronger password. ');
      case 'user-disabled':
        return const TExceptions('This user has been disabled. Please contact support for help');
      case 'user-not-found':
        return const TExceptions('Inva1id Details, please create an account. ');
      case 'wrong-password':
        return const TExceptions('Incorrect password, please try again. ');
      case 'too-many-requests':
        return const TExceptions('Too many requests, Service Temporarily blocked. ');
      case 'invalid-argument':
        return const TExceptions('An invalid argument was provided to an Authentication method. ');
      case 'invalid-password':
        return const TExceptions('Incorrect password, please try again. ');
      case 'invalid-phone-number':
        return const TExceptions('The provided Phone Number is invalid. ');
      case 'operation-not-allowed':
        return const TExceptions('THe provided sign-in provider is disabled for this Firebase project. ');
      case 'session-cookie-expired':
        return const TExceptions('The provided Firebase session cookie is expired. ');
      case 'uid-already-exists':
        return const TExceptions('The provided Uid is already in use by an existing user. ');
      default:
        return const TExceptions();
    }
  }
}
