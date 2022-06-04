class MetaException implements Exception {
  final String message;

  const MetaException(this.message);

  @override
  String toString() {
    return 'meta exception: $message';
  }
}
