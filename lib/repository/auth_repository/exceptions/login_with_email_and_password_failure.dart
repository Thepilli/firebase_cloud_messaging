class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure([this.message = 'An Unknown error']);

  factory LogInWithEmailAndPasswordFailure.fromCode(String fromCode) {
    switch (fromCode) {
      case 'email-already-in-use':
        return const LogInWithEmailAndPasswordFailure('Email already in use');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Invalid Email');
      case 'operation-not-allowed':
        return const LogInWithEmailAndPasswordFailure('Operation not allowed');
      case 'weak-password':
        return const LogInWithEmailAndPasswordFailure('Weak Password');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'This user has been disabled');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
