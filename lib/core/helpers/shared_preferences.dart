class SharedPreferences {
  SharedPreferences._();

  static setString(String key, String value) async {
    await SharedPreferences.setString(key, value);
  }
}
