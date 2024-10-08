/// 日付ユーティリティクラス
class DateCustomUtils {
  /// 年齢を計算する
  ///
  /// @param birthDate 生年月日
  /// @return 年齢
  static int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
