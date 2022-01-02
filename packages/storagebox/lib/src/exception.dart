/// A base class for all StorageBox exceptions.
class StorageBoxException implements Exception {
  StorageBoxException(this.message);
  final String message;
  @override
  String toString() {
    return 'StorageBoxException: $message';
  }
}
