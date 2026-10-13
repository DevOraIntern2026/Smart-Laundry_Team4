export const HeaderData = {
  logo: {
    src: "/logo.png",
    alt: "Nivo Logo",
    path: "/",
  },

  navLinks: [
    { label: "الرئيسية", path: "/" },
    { label: "الخدمات", path: "/services" },
    { label: "طلباتي", path: "/orders" },
    { label: "المساعد الذكي", path: "/assistant" },
  ],

  cta: {
    label: "اطلب الان",
    path: "/services",
  },

  profile: {
    path: "/profile",
    avatar: "",
    alt: "Profile Picture",
  },

  notificationsCount: 0,
};

export const NotFoundData = {
  code: "404",
  title: "الصفحة غير موجودة",
  description:
    "يبدو أن الصفحة التي تبحث عنها غير متاحة أو تم نقلها. يمكنك العودة للرئيسية أو تصفح خدماتنا.",
  primaryAction: { label: "العودة للرئيسية", path: "/" },
  secondaryAction: { label: "تصفح الخدمات", path: "/services" },
};

export const HomeData = {
  user: {
    name: "أحمد",
    subtitle: "ملابسك في أيدٍ أمينة مع نيفو الذكي",
    location: "المعادي، القاهرة",
  },

  activeOrder: {
    label: "طلب نشط",
    id: "#SL-9402",
    status: "قيد الغسيل والتعقيم",
    steps: ["تم الاستلام", "المعالجة والكوي", "جاهز للتسليم"],
    currentStep: 1,
    deliveryLabel: "التسليم المتوقع:",
    deliveryTime: "اليوم 07:30 م",
    trackLabel: "متابعة الطلب",
    trackPath: "/orders/SL-9402/tracking",
  },

  services: {
    title: "خدماتنا",
    viewAllLabel: "عرض الكل",
    viewAllPath: "/services",
    currency: "ج.م",
    items: [
      {
        id: "wash-iron",
        title: "غسيل وكوي",
        description: "غسيل عميق وكي بالبخار",
        price: 15,
        unit: "قطعة",
        image: "",
        badge: "الأكثر طلباً",
      },
      {
        id: "dry-clean",
        title: "تنظيف جاف",
        description: "عناية خاصة للبدل والفساتين",
        price: 35,
        unit: "قطعة",
        image: "",
        badge: "",
      },
      {
        id: "steam-iron",
        title: "كوي بخار فقط",
        description: "فرد وتجهيز فوري للارتداء",
        price: 10,
        unit: "قطعة",
        image: "",
        badge: "",
      },
      {
        id: "bedding",
        title: "مفروشات وبطاطين",
        description: "تعقيم بالحرارة ورائحة تدوم",
        price: 60,
        unit: "عنصر",
        image: "",
        badge: "",
      },
    ],
    featured: {
      id: "shoes-care",
      title: "عناية بالأحذية والشنط",
      description: "تنظيف متخصص وإعادة حيوية",
      badge: "يدوي",
      startingFrom: "يبدأ من 45 ج.م",
      image: "",
    },
  },

  aiAssistant: {
    title: "مساعدك نيفو الذكي",
    subtitle: "وفر وقتك واطلب بأمر صوتي أو برسالة واحدة",
    example:
      "عندي قميصين كلاسيك وبطانية كبيرة محتاجين غسيل وكوي تسليم بكرة المسا...",
    actionLabel: "جرّب مساعد نيفو الذكي",
    path: "/assistant",
  },

  quickOrder: {
    badge: "تنظيف فائق بنقرة واحدة",
    title: "ابدأ طلبك الفوري الآن",
    description:
      "حدد موقعك واختر القطع وسيقوم مندوبنا بالاستلام في غضون 30 دقيقة",
    steps: ["اختر الملابس", "مندوب يستلم", "عودة كأنها جديدة"],
    actionLabel: "اطلب الآن",
    path: "/services",
  },

  lastOrder: {
    id: "#SL-8841",
    status: "تم التوصيل بنجاح",
    date: "تم التسليم: 18 أكتوبر 2024",
    service: "تنظيف جاف خاص",
    itemsCount: "4 قطع مقاس سهرة وبدل",
    total: "140.00 ج.م",
    paymentMethod: "دفع إلكتروني",
    items: [
      { name: "قميص كاجوال (غسيل وكوي)", quantity: 2, price: "40 ج.م" },
      { name: "بنطلون جينز (غسيل وكوي بالبخار)", quantity: 1, price: "28 ج.م" },
      { name: "بطانية كينج فاخرة (عناية خاصة)", quantity: 1, price: "55 ج.م" },
    ],
    reorderLabel: "إعادة نفس الطلب",
    invoiceLabel: "عرض الفاتورة",
  },
};

export const AdminHomeData = {
  intro: {
    liveLabel: "بث تشغيلي مباشر",
    branch: "محطة فرع النخيل المتطورة",
    title: "مركز التحكم والعمليات الميدانية الحية",
    description:
      "إدارة تدفق الغسيل الفائق، جدولة مسارات التوصيل الذكية، وتدخلات مراقبة الجودة الآنية.",
  },

  // icon names match the icons map in components/adminHome/StatsCards.tsx
  // tone controls the colors of the icon, value and badge
  stats: [
    {
      title: "الطلبات النشطة اليوم",
      value: "142",
      unit: "طلب",
      icon: "orders",
      tone: "primary",
      badge: "+14% مقارنة بالأمس",
      badgeIcon: "trend",
      note: "48 طلب قيد الغسيل والتعقيم، 34 بانتظار التوصيل",
    },
    {
      title: "مهام تتطلب اتخاذ إجراء فوري",
      value: "7",
      unit: "طلبات حرجة",
      icon: "alert",
      tone: "danger",
      badge: "تأخير استلام 3 • مراجعة أسعار 4",
      badgeIcon: "",
      note: "تستوجب موافقة مشرف الجودة ومندوب النقل",
    },
    {
      title: "جاهزية الأسطول ومواعيد الاستلام",
      value: "98.4%",
      unit: "",
      icon: "fleet",
      tone: "success",
      badge: "في الموعد المحدد تماماً",
      badgeIcon: "check",
      note: "22 رحلة مندوب جارية بالـ GPS الذكي",
    },
    {
      title: "إجمالي الإيراد التشغيلي الموثق",
      value: "18,450",
      unit: "ج.م",
      icon: "revenue",
      tone: "primary",
      badge: "+9.2% نمو أسبوعي",
      badgeIcon: "up",
      note: "شامل الفواتير والمدفوعات الإلكترونية المؤكدة",
    },
  ],

  flowChart: {
    title: "المخطط البياني للتدفق",
    subtitle: "توزيع أحمال الاستلام مقابل الطاقة الاستيعابية القصوى",
    capacityLabel: "حد الطاقة: 90%",
    thresholdLabel: "عتبة الضغط القصوى (90%)",
    threshold: 90,
    // value is the load percentage, status: low | normal | peak
    bars: [
      { time: "08:00", value: 30, status: "low" },
      { time: "10:00", value: 85, status: "normal" },
      { time: "12:00", value: 95, status: "peak" },
      { time: "02:00", value: 92, status: "normal" },
      { time: "04:00", value: 48, status: "low" },
      { time: "06:00", value: 95, status: "peak" },
      { time: "08:00", value: 66, status: "normal" },
      { time: "10:00", value: 26, status: "low" },
    ],
    peaksNote: "ذروات الاستلام الحالية: 12:00 ظهراً و 06:00 مساءً",
  },

  activityLog: {
    title: "سجل النشاطات والأحداث التشغيلية",
    // tone: success | primary | danger | muted
    items: [
      {
        title: "اعتماد فحص الجودة النهائي",
        before: "اجتاز الطلب",
        orderId: "#9812",
        after:
          "مرحلة اختبار خلو العوالق والتغليف الحراري بواسطة المشرف أحمد زكي.",
        time: "منذ 3 دقائق",
        tone: "success",
      },
      {
        title: "تسليم شحنة وتوثيق التوقيع",
        before: "تم تسليم الطلب",
        orderId: "#9804",
        after: "بنجاح للعميل، واستلام الدفع الإلكتروني بنجاح (340 ج.م).",
        time: "منذ 9 دقائق",
        tone: "primary",
      },
      {
        title: "تنبيه تأخر استلام شحنة",
        before: "تعذر وصول العميل لهاتف في الموعد المحدد للطلب",
        orderId: "#9798",
        after: "تم تحويله لمسار المحاولة المسائية.",
        time: "منذ 16 دقيقة",
        tone: "danger",
      },
      {
        title: "بدء دورة غسيل آلية كبرى #08",
        before: "",
        orderId: "",
        after:
          "حمولة 60 كجم مفروشات وأغطية أسرة - برنامج التعقيم الحراري بالأوزون.",
        time: "منذ 24 دقيقة",
        tone: "muted",
      },
    ],
  },

  drivers: {
    title: "حالة مسارات مناديب الاستلام والتوصيل",
    items: [
      {
        initials: "ف.ع",
        name: "كابتن فهد العتيبي",
        vehicle: "مركبة كهربائية 04 • حي النخيل",
        status: "في المسار",
        remaining: "المتبقي: 3 طلبات تسليم",
        destinationLabel: "الوجهة:",
        destination: "مجمع النخيل السكني",
      },
    ],
  },
};
