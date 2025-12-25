// class to create extension for String
extension StringExtension on String {
  //method to get the initial (eg: ram -> R)
  String get getInitial {
    String value = this;

    String initial = value[0].toUpperCase();
    return initial;
  }
}
