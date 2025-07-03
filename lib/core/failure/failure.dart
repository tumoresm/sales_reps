class AppFailure {
  final String message;
  AppFailure.network([this.message = 'Network error occurred.']);
  AppFailure.server([this.message = 'Server error occurred.']);
  AppFailure.validation([this.message = 'Validation error occurred.']);
  AppFailure.custom(this.message);
}
