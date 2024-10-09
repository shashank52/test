class EmptyException implements Exception {
  final String message;
  EmptyException(this.message);
}

class RepoException implements Exception {
  final String message;
  RepoException(this.message);
}

