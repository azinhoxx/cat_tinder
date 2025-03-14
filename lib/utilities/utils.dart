class AppUtils {
  AppUtils._();

  static T? safeCast<T>(dynamic value) {
    return (value is T) ? value : null;
  }
}
