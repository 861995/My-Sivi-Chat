class AppConstantString {
  static const String noInternetTitle = "No internet connection";
  static const String yes = "Yes";
  static const String no = "No";
  static const String home = "Home";
  static const String setting = "Setting";
  static const String other = "Other";

  static String dataParsedSuccessfully(String data) =>
      "✅ Data parsed successfully => $data";

  static String dataParsingError(String error, String methodName) =>
      "❌ Error in data parsing => $error happened in method name is => $methodName";
}
