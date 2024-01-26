/// String extensions
extension StringExtension on String? {
  bool get isNotNullAndEmpty => this != null && this!.isEmpty;
  bool compareWithIgnoreCase(String value) => this!.toLowerCase().compareTo(value.toLowerCase()) == 0;
}

/// List extensions
extension StringContainsWithIgnoreCases on List {
  bool containsWithIgnoreCases(String value) {
    for (var val in this) {
      if (value.compareWithIgnoreCase(val)) {
        return true;
      }
    }

    return false;
  }
}
