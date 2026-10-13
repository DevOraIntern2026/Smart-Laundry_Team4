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
