part of dart_zaim_client;

class ZaimError extends Error {
  final String message;
  final int status;

  ZaimError(this.status, this.message);
}
