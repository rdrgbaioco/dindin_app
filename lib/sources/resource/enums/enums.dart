enum StatusCode {
  ok(200, "OK"),
  created(201, "Created"),
  noContent(204, "No Content"),
  badRequest(400, "Bad Request"),
  unauthorized(401, "Unauthorized"),
  forbidden(403, "Forbidden"),
  notFound(404, "Not Found");

  final String message;
  final int code;
  const StatusCode(
    this.code,
    this.message,
  );
}

enum LoginEnum {
  idle,
  loading,
  authenticated,
  unauthenticated,
  error,
}

enum AuthEnum {
  idle,
  loading,
  authenticated,
  unauthenticated,
  error,
  invalid,
}

enum RegisterEnum {
  idle,
  created,
  alreadyExists,
  error,
}

enum RegisterStatus {
  idle,
  loading,
  success,
  invalid,
}

enum VerifyKey { contains, noValue, noKey }

enum TransactionType {
  entrada("entrada"),
  saida("saida");

  const TransactionType(this.tipo);
  final String tipo;
}

enum TransactionStatus {
  idle,
  created,
  error,
}