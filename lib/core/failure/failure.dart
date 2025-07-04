// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppFailure {
  final String message;
  AppFailure.network([this.message = 'Network error occurred.']);
  AppFailure.server([this.message = 'Server error occurred.']);
  AppFailure.validation([this.message = 'Validation error occurred.']);
  AppFailure.custom(this.message);

  @override
  String toString() => 'AppFailure(message: $message)';
}
