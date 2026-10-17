/// Static (non-backend) UI strings for the profile feature.
/// Backend-driven values (name, phone, addresses, areas, counters, VIP tier...)
/// are intentionally NOT here.
class AppStrings {
  AppStrings._();

  // ───────────── Addresses view ─────────────
  static const String editMyAddress = 'تعديل عنواني';
  static const String savedAddresses = 'العناوين المحفوظة';
  static const String addNewAddress = 'إضافة عنوان جديد';

  /// e.g. "2 عناوين"
  static String addressesCount(int count) => '$count عناوين';

  // ───────────── Profile view ─────────────
  static const String arabic = 'العربية';
  static const String logout = 'تسجيل خروح';

  // ───────────── Address popup ─────────────
  static const String close = 'إغلاق';
  static const String addressType = 'نوع العنوان';
  static const String governorateAndArea = 'المحافظة و المنطقة';
  static const String streetName = 'اسم الشارع الرئيسي و الفرعي';
  static const String streetNameHint =
      'مثال: شارع النصر، متفرع من شارع اللاسلكي';
  static const String landmarkAndNotes = 'علامة مميزة وملاحظات للمندوب';
  static const String landmarkAndNotesHint =
      'مثال: بجوار صيدلية العزبي، المصعد شغال، يرجى الرن على الجرس';
  static const String saveAddress = 'حفظ العنوان';

  // ───────────── Address types ─────────────
  static const String typeHome = 'المنزل';
  static const String typeWork = 'العمل';
  static const String typeOther = 'أخرى';

  // ───────────── Address card ─────────────
  static const String defaultAddress = 'العنوان الافتراضي';
  static const String secondaryAddress = 'عنوان ثانوي';
  static const String pickupPhone = 'هاتف الاستلام: ';
  static const String courierInstructions = 'تعليمات للمندوب:';

  // ───────────── Address card actions ─────────────
  static const String setAsDefault = 'تعيين كافتراضي';
  static const String edit = 'تعديل';
  static const String delete = 'حذف';
}
