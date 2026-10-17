/// All static (non-backend) UI strings of the app.
/// Backend-driven values (names, phones, order ids, prices, dates, statuses,
/// addresses, areas, counters, VIP tier...) are intentionally NOT here.
class AppStrings {
  AppStrings._();

  // ───────────── App / Bottom nav ─────────────
  static const String appTitle = 'Smart Laundry';
  static const String home = 'الرئيسية';
  static const String services = 'الخدمات';
  static const String aiAssistant = 'المساعد الذكي';
  static const String orders = 'طلباتي';
  static const String profile = 'حسابي';

  // ───────────── Splash ─────────────
  static const String splashPlaceholder = 'Splash Screen';

  // ───────────── Services ─────────────
  static const String all = "الكل";
  static const String washAndIron = "غسيل وكوي";
  static const String steamIronOnly = "كوي بخار فقط ";
  static const String dryCleaning = "تنظيف جاف (Dry Clean)";
  static const String upholstery = "مفروشات";
  static const String search = "بحث";

  // ───────────── Profile view ─────────────
  static const String completedOrders = 'طلبات مكتملة';
  static const String refreshedPieces = 'قطعة منعشة';
  static const String savedHours = 'سعات موفرة';
  static const String mangeProfile = "إدارة الحساب و العناوين";
  static const String prefs = "التفضيلات و النظام";
  static const String help = "المساعدةو الضمان";

  static const String personalInfo = "المعلومات الشخصية";
  static const String personalInfDesc = "الاسم، البريد، كلمة المرور";

  static const String addresses = "عناويني";
  static const String addressesDesc = "المنزل، العمل، تفاصيل التسليم";

  static const String paymentMethods = "طرق الدفع";
  static const String paymentMethodsDesc = "البطاقات البنكية، فودافون كاش";

  static const String notifications = "سجل الاشعارات";
  static const String notificationsDesc = "تتبع حالة الملابس و مواعيد الكابتن";

  static const String languages = "اللغة و التفضيلات";
  static const String languagesDesc = "العربية، المعطرات، درجات الحرارة";

  static const String helpCenter = "مركز المساعدة";
  static const String helpCenterDesc = "محادثة حية مع فريق خدمة عملاء نيفو 24/7";

  static const String warranty = "سياسة الضمان";
  static const String warrantyDesc = "ضمان نيفو 100% لسلامة الأقمشة الفاخرة";

  static const String arabic = 'العربية';
  static const String logout = 'تسجيل خروح';

  // ───────────── Addresses view ─────────────
  static const String editMyAddress = 'تعديل عنواني';
  static const String savedAddresses = 'العناوين المحفوظة';
  static const String addNewAddress = 'إضافة عنوان جديد';

  /// e.g. "2 عناوين"
  static String addressesCount(int count) => '$count عناوين';

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

  // ───────────── Welcome ─────────────
  static const String languageShort = 'EN';
  static const String serviceAvailable = 'الخدمة متاحة الآن في مدينتك';
  static const String welcomeAppName = 'نيفو';
  static const String welcomeSlogan = 'غسيل أذكى، وقت أكثر لما تحب';
  static const String welcomeDescription =
      'تجربة عناية متطورة بملابسك تدار كلياً بأحدث تقنيات الفحص والجدولة التلقائية.';
  static const String superIntelligence = 'ذكاء فائق';

  static const String featureDeliveryTitle = 'استلام وتسليم مجاني من باب بيتك';
  static const String featureDeliverySubtitle =
      'مندوبنا يصلك في الموعد المحدد بدقة فائقة';
  static const String featureTrackingTitle =
      'أسعار شفافة وتتبع دقيق لحظة بلحظة';
  static const String featureTrackingSubtitle =
      'راقب مراحل غسيل وكي ملابسك مباشرة من هاتفك';
  static const String featureAiTitle = 'خدمة ذكية مدعومة بالذكاء الاصطناعي';
  static const String featureAiSubtitle = 'تعرف على الأقمشة ومسارات العناية المثلى';

  static const String trustGuarantee =
      'ضمان العناية التامة بنظافة وراحة أنسجتك بنسبة 100%';
  static const String getStarted = 'ابدأ الآن';
  static const String welcomeHaveAccount = 'لديك حساب بالفعل؟ ';
  static const String welcomeTermsPrefix = 'بالبدء أنت توافق على ';
  static const String termsOfService = 'شروط الخدمة';

  // ───────────── Auth: common ─────────────
  static const String login = 'تسجيل الدخول';
  static const String password = 'كلمة المرور';
  static const String passwordHint = '••••••••';
  static const String confirmPassword = 'تأكيد كلمة المرور';
  static const String forgotPasswordQuestion = 'نسيت كلمة المرور؟';
  static const String privacyPolicy = 'سياسة الخصوصية';
  static const String andWord = ' و';
  static const String requiredMark = '*';
  static const String requiredLabel = 'مطلوب';
  static const String alreadyHaveAccount = 'لديك حساب بالفعل؟';

  // ───────────── Auth: login ─────────────
  static const String loginBadge = 'العناية الذكية بالملابس';
  static const String welcomeBack = 'مرحباً بعودتك!';
  static const String loginSubtitle =
      'سجّل دخولك لمتابعة وطلب غسيل ملابسك بكل\nراحة وسرعة';
  static const String phoneOrEmail = 'رقم الهاتف أو البريد الإلكتروني';
  static const String phoneOrEmailHint = 'name@example.com أو 01X XXXX XXXX';
  static const String orLoginWith = 'أو الدخول عبر';
  static const String google = 'Google';
  static const String apple = 'Apple';
  static const String noAccount = 'ليس لديك حساب؟';
  static const String createNewAccount = 'إنشاء حساب جديد';
  static const String loginTerms =
      'بالتسجيل أنت توافق على شروط الخدمة وسياسة الخصوصية الخاصة بنيفو';

  // ───────────── Auth: forgot password ─────────────
  static const String resetPasswordTitle = 'اعادة تعيين كلمة السر';
  static const String forgotPasswordDesc =
      'لا تقلق! أدخل رقم هاتفك أو بريدك الإلكتروني المسجل وسنرسل لك رمز تحقق لإعادة تعيين كلمة المرور.';

  // ───────────── Auth: sign up ─────────────
  static const String signUpTitle = 'انشاء حساب';
  static const String joinNivo = 'انضم إلى نيفو';
  static const String joinNivoDesc = 'واستمتع بأسهل تجربة غسيل وكوي فائقة العناية';
  static const String fullName = 'الاسم بالكامل';
  static const String fullNameHint = 'مثال: أحمد عبد الله';
  static const String phoneNumber = 'رقم الهاتف';
  static const String phoneConfirmAppointments = 'لتأكيد المواعيد';
  static const String phoneHint = '5678 1234 10';
  static const String countryFlagEg = '🇪🇬';
  static const String countryCodeEg = '+20';
  static const String email = 'البريد الإلكتروني';
  static const String emailHint = 'name@example.com';
  static const String optionalForInvoices = '(اختياري للفواتير)';
  static const String iAgreeTo = 'أوافق على ';
  static const String termsAndConditions = 'الشروط والأحكام';
  static const String createAccountContinue = 'إنشاء الحساب والمتابعة';
  static const String dataEncrypted = 'بياناتك مشفرة ومحمية';
  static const String instantActivation = 'تفعيل فوري للخدمة';

  // ───────────── Auth: password strength ─────────────
  static const String passwordStrength = 'قوة كلمة المرور';
  static const String strengthWeak = 'ضعيفة';
  static const String strengthMedium = 'متوسطة';
  static const String strengthStrong = 'قوية ومثالية';
  static const String strengthEmpty = 'أدخل كلمة المرور';

  // ───────────── Orders: tracking ─────────────
  static const String orderTracking = 'تتبع الطلب';
  static const String orderCode = 'كود الطلب:';
  static const String trackOrderStages = 'تتبع مراحل الطلب';
  static const String courierSection = 'مندوب الاستلام والتوصيل';
  static const String invoiceDetails = 'تفاصيل الفاتورة والأصناف';
  static const String deliveryFee = 'رسوم التوصيل والاستلام';
  static const String finalTotal = 'الإجمالي النهائي';

  /// e.g. "3 قطع"
  static String piecesCount(int count) => '$count قطع';

  /// e.g. "4.9 (186 تقييم)"
  static String ratingWithReviews(num rating, int reviews) =>
      '$rating ($reviews تقييم)';

  /// e.g. "105 ج.م"
  static String priceEgp(num price) => '$price ج.م';

  // ───────────── Orders: timeline steps ─────────────
  static const String stepOrderConfirmed = 'تم تأكيد الطلب';
  static const String stepOrderConfirmedDesc = 'تم استلام طلبك وتأكيده بنجاح';
  static const String stepClothesReceived = 'تم استلام الملابس';
  static const String stepClothesReceivedDesc = 'المندوب استلم ملابسك من منزلك';
  static const String stepProcessing = 'المعالجة والغسيل الآن';
  static const String stepProcessingDesc =
      'جاري تنظيف ملابسك بالمعايير المعتمدة وبأعلى جودة';
  static const String stepReadyForDelivery = 'جاهز للتوصيل والتغليف';
  static const String stepDelivering = 'جاري التوصيل للمنزل';
  static const String stepWaiting = 'في الانتظار';
  static const String stepDelivered = 'تم التسليم بنجاح';

  // ───────────── Orders: support banner ─────────────
  static const String haveQuestion = 'هل لديك أي استفسار؟';
  static const String talkToUs = 'تحدث معنا';

  // ───────────── Order confirmed ─────────────
  static const String trackOrderStatus = 'تتبع حالة الطلب';
  static const String nivoSmartLaundry = 'نيفو. خدمة الغسيل الذكي';
  static const String orderConfirmedTitle = 'تم تأكيد طلبك بنجاح';
  static const String yourOrderNumberIs = 'رقم الطلب الخاص بك هو';
  static const String courierNotified = 'لقد تم ارسال اشعار للمندوب';
  static const String liveTimeline = 'المسار الزمني المباشر';
  static const String visitTime = 'موعد الزيارة';
  static const String pickupAddress = 'عنوان الاستلام';
  static const String invoiceTotal = 'إجمالي الفاتورة';
  static const String quickGuideTitle = 'إرشاد سريع ومريح';
  static const String quickGuideDesc =
      'يرجى وضع الملابس في أي كيس متاح لديك؛ سيقوم مندوب نيفو بوضع بطاقة تعريف ذكية مخصصة لكل قطعة وفرزها بأمان أمامك.';
  static const String needRescheduling = 'هل تحتاج تعديل الموعد؟';
  static const String contactNivoSupport = 'تواصل مع خدمة عملاء نيفو';
}
