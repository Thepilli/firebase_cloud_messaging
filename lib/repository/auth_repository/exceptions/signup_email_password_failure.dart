class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = 'An Unknown error']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('Email already in use');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Invalid Email');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation not allowed');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Weak Password');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('This user has been disabled');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
