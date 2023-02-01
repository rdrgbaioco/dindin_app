class UserNotFoundException implements Exception {
  final String message;

  const UserNotFoundException(this.message);
}

class InvalidCredentialsException implements Exception {
  final String message;

  const InvalidCredentialsException(this.message);
}
