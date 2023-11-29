sealed class LocaleUtils {
  //get short locale name
  //Example: ru_RU => ru
  static String getShortLocaleName(String locale) {
    return locale.substring(0, 2);
  }
}
