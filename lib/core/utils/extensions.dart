/// String extensions
extension StringExtension on String? {
  bool get isNotNullAndEmpty => this != null && this!.isEmpty;
}
