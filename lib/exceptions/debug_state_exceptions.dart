class DebugStateException implements Exception {
  String cause;
  String info;

  DebugStateException({required this.cause, required this.info});

  @override
  String toString() => '$cause + $info';
}
