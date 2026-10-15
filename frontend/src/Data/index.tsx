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

export const AdminOrdersData = {
  intro: {
    title: "إدارة وسجل الطلبات التشغيلية",
    liveLabel: "بث مباشر للعمليات",
    description:
      "متابعة دقيقة لمراحل الغسيل، الفرز الآلي، والتوزيع اللوجستي بكفاءة SLA تبلغ 99.4%",
    exportLabel: "تصدير تقرير (Excel)",
    createLabel: "إنشاء طلب يدوي",
  },

  stats: [
    { title: "كافة الطلبات", value: 142, note: "طلب اليوم", icon: "all", tone: "primary", progress: 100, highlight: false },
    { title: "جارية في المغسلة", value: 48, note: "3 غسالات نشطة", icon: "washing", tone: "primary", progress: 50, highlight: true },
    { title: "مجدولة للاستلام", value: 24, note: "بين 2 - 6 مساءً", icon: "scheduled", tone: "muted", progress: 70, highlight: false },
    { title: "في طريق التوصيل", value: 20, note: "4 مناديب نشطين", icon: "delivery", tone: "primary", progress: 50, highlight: true },
    { title: "مكتملة اليوم", value: 43, note: "+18% نمو", icon: "completed", tone: "success", progress: 80, highlight: true },
  ],

  tabs: [
    { id: "all", label: "الكل", count: 142 },
    { id: "urgent", label: "تتطلب إجراء فوري", count: 7 },
    { id: "washing", label: "النشطة بالمغسلة", count: 48 },
    { id: "pickup", label: "بانتظار الاستلام", count: 24 },
    { id: "delivery", label: "جاهزة للتوصيل", count: 20 },
    { id: "completed", label: "المكتملة", count: 43 },
    { id: "cancelled", label: "الملغاة", count: 4 },
  ],

  filters: {
    searchPlaceholder: "ابحث برقم الطلب (#ORD)، العميل، أو الجوال...",
    date: { label: "النطاق:", options: ["اليوم (18 أكتوبر)", "أمس", "آخر 7 أيام"] },
    service: { label: "نوع الخدمة:", options: ["الكل", "غسيل وكوي", "تنظيف جاف", "كوي بخار"] },
    driver: { label: "المندوب:", options: ["جميع المناديب", "عمر الفهد", "فهد العتيبي"] },
  },

  table: {
    columns: [
      "رقم الطلب والنوع",
      "العميل والموقع",
      "محتوى القطع والخدمة",
      "الجدول الزمني والـ SLA",
      "المالية والدفع",
      "المرحلة التشغيلية",
      "إجراءات سريعة",
    ],
    orders: [
      {
        id: "ORD-9842",
        category: "urgent",
        priority: "vip",
        priorityLabel: "عاجل VIP",
        service: "تنظيف جاف حريري فاخر",
        customer: "د. منصور العتيبي",
        phone: "0505129841",
        address: "حي النخيل الغربي، فيلا 14",
        itemsTitle: "4 قطع خاصة",
        itemsDetails: "فستان سهرة دانتيل + بدلة إيطالية رجالية قطعتين",
        itemsTag: "عناية خاصة",
        sla: {
          label: "متبقي 42 دقيقة للتسليم",
          progress: 90,
          tone: "danger",
          schedule: "استلام 10:15 ص ← تسليم مستهدف 02:00 م",
        },
        amount: "340.00 ج.م.",
        payment: "مدفوع عبر مدى",
        invoice: "فاتورة ضريبية #INV-771",
        stage: { label: "فحص بقع معقدة", tone: "danger" },
      },
      {
        id: "ORD-9841",
        category: "washing",
        priority: "normal",
        priorityLabel: "عادي",
        service: "غسيل أوزون وكوي بخاري",
        customer: "سارة ناصر السبيعي",
        phone: "0542389104",
        address: "حي حطين، مجمع أوركيد شقة 203",
        itemsTitle: "8 قطع منزلية",
        itemsDetails: "6 أثواب شتوية رجالية + 2 عباية مطرزة",
        itemsTag: "",
        sla: {
          label: "الالتزام 100% (باقي 4 ساعات)",
          progress: 60,
          tone: "primary",
          schedule: "استلام 09:00 ص ← تسليم 06:00 م",
        },
        amount: "128.50 ج.م.",
        payment: "محفظة Apple Pay",
        invoice: "فاتورة ضريبية #INV-770",
        stage: { label: "قيد الغسيل (الغسالة #04)", tone: "primary" },
      },
      {
        id: "ORD-9839",
        category: "pickup",
        priority: "normal",
        priorityLabel: "عادي",
        service: "غسيل وكوي",
        customer: "خالد عبد الرحمن",
        phone: "0551237788",
        address: "حي الياسمين، عمارة 9 شقة 4",
        itemsTitle: "5 قطع",
        itemsDetails: "3 قمصان رسمية + 2 بنطلون قماش",
        itemsTag: "",
        sla: {
          label: "استلام مجدول 04:00 م",
          progress: 20,
          tone: "muted",
          schedule: "استلام 04:00 م ← تسليم غداً 12:00 م",
        },
        amount: "75.00 ج.م.",
        payment: "الدفع عند الاستلام",
        invoice: "فاتورة ضريبية #INV-768",
        stage: { label: "بانتظار المندوب", tone: "muted" },
      },
      {
        id: "ORD-9836",
        category: "delivery",
        priority: "normal",
        priorityLabel: "عادي",
        service: "مفروشات وبطاطين",
        customer: "نورة الشهري",
        phone: "0569981230",
        address: "حي الملقا، فيلا 22",
        itemsTitle: "3 قطع كبيرة",
        itemsDetails: "بطانية كينج + 2 لحاف قطني",
        itemsTag: "",
        sla: {
          label: "الالتزام 100% (باقي ساعة)",
          progress: 85,
          tone: "primary",
          schedule: "استلام 08:30 ص ← تسليم 03:00 م",
        },
        amount: "180.00 ج.م.",
        payment: "مدفوع عبر مدى",
        invoice: "فاتورة ضريبية #INV-765",
        stage: { label: "جاهز للتوصيل", tone: "primary" },
      },
      {
        id: "ORD-9830",
        category: "completed",
        priority: "normal",
        priorityLabel: "عادي",
        service: "كوي بخار فقط",
        customer: "عبدالله القحطاني",
        phone: "0533456789",
        address: "حي العليا، برج 3 مكتب 12",
        itemsTitle: "6 قطع",
        itemsDetails: "4 قمصان + 2 بدلة رسمية",
        itemsTag: "",
        sla: {
          label: "تم التسليم في الموعد",
          progress: 100,
          tone: "success",
          schedule: "استلام 07:00 ص ← تسليم 11:30 ص",
        },
        amount: "60.00 ج.م.",
        payment: "محفظة Apple Pay",
        invoice: "فاتورة ضريبية #INV-760",
        stage: { label: "تم التسليم", tone: "success" },
      },
    ],
    pagination: {
      summary: "عرض 1 - 5 من أصل 142 طلب تشغيلي",
      rowsLabel: "عدد الصفوف بالصفحة:",
      rowsValue: "15 صف",
      pages: [1, 2, 3],
      lastPage: 10,
    },
  },

  quality: {
    title: "مؤشر أداء الجودة والـ SLA",
    badge: "ممتاز (99.4%)",
    cycleLabel: "متوسط وقت دورة الغسيل",
    cycleValue: "2 ساعة و 14 دقيقة",
    cycleNote: "أسرع بـ 12 دقيقة من المستهدف",
    score: 92,
  },

  stations: {
    title: "طاقة محطات التشغيل",
    badge: "سعة 84%",
    unit: "قطعة",
    items: [
      { name: "محطة الفرز والتعقيم بالأوزون", used: 18, total: 20, tone: "primary" },
      { name: "غسالات العناية بالأقمشة الحساسة", used: 12, total: 16, tone: "primary" },
      { name: "مكابس البخار والتغليف الآلي", used: 22, total: 25, tone: "success" },
    ],
  },

  fleet: {
    title: "تغطية أسطول التوصيل",
    drivers: [
      {
        name: "عمر الفهد (شمال الرياض)",
        lastUpdate: "آخر تحديث للموقع: قبل دقيقة واحدة",
        remaining: "3 طلبات متبقية",
      },
    ],
    speedLabel: "معدل سرعة التسليم اليوم:",
    speedValue: "31 دقيقة / رحلة",
  },
};

export const AdminOrderDetailsData = {
  backLabel: "العودة لسجل الطلبات",
  backPath: "/admin/orders",

  summary: {
    title: "طلب تشغيلي",
    id: "#ORD-9842",
    tags: [
      { label: "خدمة نيفو السريعة (Express 24h)", tone: "primary" },
      { label: "عضوية ماسية", tone: "danger" },
    ],
    createdAt: "تاريخ الإنشاء: اليوم، 10:15 صباحاً",
    statusLabel: "الحالة التشغيلية:",
    status: "قيد الغسيل والتعقيم الحيوي بالأوزون",
    sla: "SLA: 01:45:00 متبقي",
  },

  stats: [
    { label: "القطع المفحوصة", value: "3 قطع / 4 وحدات", icon: "items", tone: "primary" },
    { label: "المسح الضوئي الذكي (AI)", value: "مكتمل 100%", icon: "scan", tone: "success" },
    { label: "طريقة الدفع", value: "مدى (معتمد)", icon: "payment", tone: "primary" },
    { label: "فارق زمن التسليم", value: "-25 دقيقة (مبكر)", icon: "time", tone: "danger" },
  ],

  customer: {
    title: "بيانات العميل والتوصيل المعتمدة",
    otp: "رمز التحقق للاستلام: OTP #4891",
    name: "د. سارة عبد الرحمن",
    initials: "س.ع",
    membership: "عميل نيفو الماسي",
    phone: "+20 102 984 5512",
    address: "المعادي الجديدة - شارع النصر المتفرع من شارع 14",
    addressDetails:
      "برج الياسمين الإداري السكني - الدور 4 - شقة 42 (رنين الجرس مرتين)",
    notes: "تعليمات خاصة: ملابس حساسة جداً",
    historyLabel: "سجل الطلبات السابقة (28 طلب)",
  },

  items: {
    title: "محتويات الطلب وفحص الذكاء الاصطناعي الذكي",
    badge: "3 قطع محددة مع باركود منفصل",
    columns: [
      "القطعة ومسار المعالجة",
      "الخدمة المطلوبة",
      "تقرير الفحص البصري (AI)",
      "السعر",
    ],
    list: [
      {
        name: "فستان سواريه حرير طبيعي",
        barcode: "باركود: NV-9842-A1#",
        details: "قماش ناعم حساس",
        service: "تنظيف جاف هيدروكربون",
        serviceNote: "كي بخاري رأسي يدوي",
        inspection: {
          status: "issue",
          title: "رصد بقعة زيت خفيفة",
          note: "تم التقاطها آلياً قبل الاستلام (الطرف الأيمن)",
        },
        price: "95.00 ج.م",
        image: "",
      },
      {
        name: "بدلة رجالية فاخرة (قطعتين)",
        barcode: "باركود: NV-9842-B2#",
        details: "جاكيت + بنطال صوف",
        service: "تنظيف جاف متقدم",
        serviceNote: "كي رول مضغوط ألماني",
        inspection: {
          status: "ok",
          title: "سليمة بالكامل",
          note: "لا توجد تمزقات أو تلف بالأزرار",
        },
        price: "95.00 ج.م",
        image: "",
      },
      {
        name: "قميص كلاسيك قطني فاخر",
        barcode: "باركود: NV-9842-C3#",
        details: "قطن مصري 100%",
        service: "غسيل مخصص + نشا خفيف",
        serviceNote: "شماعة خشبية مجانية مع تغليف هوائي",
        inspection: {
          status: "ok",
          title: "سليمة بالكامل",
          note: "الياقة والأساور بحالة ممتازة",
        },
        price: "25.00 ج.م",
        image: "",
      },
    ],
  },

  invoice: {
    title: "الفاتورة الضريبية وبيانات التحصيل",
    lines: [
      { label: "المجموع الفرعي للخدمات:", value: "260.00 ج.م", tone: "normal" },
      { label: "خصم باقة نيفو بلاتينيوم (10%):", value: "-26.00 ج.م", tone: "discount" },
      { label: "ضريبة القيمة المضافة (14%):", value: "32.76 ج.م", tone: "normal" },
    ],
    totalLabel: "الإجمالي الصافي:",
    totalNote: "شامل الضريبة وكافة الرسوم",
    total: "266.76 ج.م",
    payment: {
      title: "بيانات ووسيلة الدفع",
      rows: [
        { label: "طريقة السداد:", value: "بطاقة مدى البنكية •••• 9102" },
        { label: "الرقم المرجعي (RRN):", value: "TXN-4920491823" },
        { label: "وقت المعاملة:", value: "10:20:14 صباحاً (معتمدة فوراً)" },
      ],
      downloadLabel: "تحميل الفاتورة الإلكترونية PDF",
      qrLabel: "ZATCA QR Ready",
    },
  },

  timeline: {
    title: "الخط الزمني المباشر لمراحل الطلب",
    liveLabel: "محدث تلقائياً",
    steps: [
      {
        title: "إنشاء الطلب عبر المساعد الذكي",
        description: "طلب إلكتروني مباشر وتحديد الأصناف الأولية بواسطة العميل.",
        time: "10:15 ص",
        status: "done",
        actionLabel: "",
      },
      {
        title: "اعتماد الطلب وتأكيد السداد",
        description: "تم توجيه أمر التحضير إلى كابتن الحي وتعيين مسار الاستلام.",
        time: "10:20 ص",
        status: "done",
        actionLabel: "",
      },
      {
        title: "استلام الملابس والتحقق عبر OTP",
        description: "تم الاستلام من العميل بواسطة كابتن فهد العتيبي بعد مطابقة الرمز.",
        time: "11:30 ص",
        status: "done",
        actionLabel: "",
      },
      {
        title: "فحص الأقمشة والمسح البصري الذكي",
        description: "تم توثيق 3 صور احترافية لسلامة الأقمشة والأزرار.",
        time: "12:15 م",
        status: "done",
        actionLabel: "عرض الصور",
      },
      {
        title: "قيد الغسيل والتعقيم الحيوي (المرحلة الحالية)",
        description:
          "جهاز التنظيف الجاف رقم M-04# - دورة الهيدروكربون البيئي على حرارة 30° مئوية.",
        time: "نشط الآن",
        status: "current",
        actionLabel: "",
      },
      {
        title: "الكي البخاري والتغليف بعطر اللافندر",
        description: "وضع أغطية الحماية المعقمة مع بطاقات نيفو المعطرة الفاخرة.",
        time: "المرحلة القادمة",
        status: "upcoming",
        actionLabel: "",
      },
      {
        title: "خروج مع كابتن التوصيل",
        description: "نقل القطع في كابينة فان مكيفة مخصصة للملابس المكوية.",
        time: "المتوقع: 02:45 م",
        status: "upcoming",
        actionLabel: "",
      },
      {
        title: "تسليم مكتمل للعميل",
        description: "",
        time: "الموعد الأقصى: 03:30 م",
        status: "upcoming",
        actionLabel: "",
      },
    ],
    currentProgress: {
      progress: 72,
      label: "دورة الغسيل: 72% مكتمل",
      remaining: "الوقت المتبقي: 22 دقيقة",
    },
  },

  driver: {
    title: "كابتن التوصيل والتسليم المكلّف",
    name: "كابتن عادل الدوسري",
    initials: "ع.د",
    rating: "4.92 (840 رحلة)",
    vehicle: "مركبة فان كهربائية صديقة للبيئة EV-04#",
    location: "الموقع الحالي: محطة المعادي المركزية (على بعد 8 دقائق)",
    phone: "+201000000000",
    callLabel: "اتصال هاتفي سريع",
    chatLabel: "محادثة واتساب",
  },
};

export const CustomerServicesData = {
  hero: {
    badge: "تقنية المعالجة بالنانو-بابلز ومساحيق بيئية 100%",
    title: "خدمات نيفو الذكية للعناية بالملابس",
    description:
      "اختر نوع الخدمة لتخصيص جدول الغسيل، المنظفات، ومستوى الكي والتعقيم. نضمن حماية خيوط النسيج وأعلى معايير الانتعاش دون استهلاك مفرط للمياه أو المواد الكيميائية.",
    stats: [
      { value: "24H", label: "تسليم إكسبريس", tone: "primary" },
      { value: "99.8%", label: "نسبة إزالة البقع", tone: "success" },
      { value: "40k+", label: "قطعة معالجة", tone: "danger" },
    ],
  },

  searchPlaceholder:
    "ابحث عن خدمة، قطعة ملابس محددة (قميص، بدلة، جاكيت...) أو نوع خامة...",
  emptyMessage: "لا توجد خدمات مطابقة لبحثك",

  categories: [
    { id: "all", label: "كل الخدمات (28)", icon: "all" },
    { id: "wash", label: "غسيل وكوي", icon: "wash" },
    { id: "dry", label: "تنظيف جاف فاخر", icon: "dry" },
    { id: "bedding", label: "مفروشات وبطاطين", icon: "bedding" },
    { id: "leather", label: "أحذية وجلود", icon: "leather" },
    { id: "steam", label: "تعقيم بالبخار الطبي", icon: "steam" },
  ],

  currency: "ج.م",
  startingFromLabel: "يبدأ من",
  ratingLabel: "تقييم",
  actionLabel: "عرض القطع والأسعار",

  services: [
    {
      id: "daily-wash",
      category: "wash",
      tag: "الرعاية اليومية",
      title: "غسيل وكوي يومي",
      description:
        "غسيل لطيف بحرارة 40° مئوية يحافظ على الألوان وألياف النسيج، متبوع بكي بخاري احترافي وتغليف معلق.",
      price: 15,
      rating: 4.9,
      reviews: "12.4k",
      image: "",
    },
    {
      id: "dry-clean",
      category: "dry",
      tag: "رعاية فائقة",
      title: "تنظيف جاف خاص (Dry Clean)",
      description:
        "حماية خاصة لأقمشة الصوف الإنجليزي، الحرير الطبيعي، وبدل السهرة الرسمية.",
      price: 45,
      rating: 4.95,
      reviews: "8.1k",
      image: "",
    },
    {
      id: "steam-iron",
      category: "steam",
      tag: "تنظيف سريع",
      title: "كي فاخر بالبخار فقط",
      description:
        "مكابس ألمانية دقيقة بالبخار الجاف تزيل أدق التجاعيد وتمنح الملابس هنداماً مثالياً فورياً.",
      price: 10,
      rating: 4.85,
      reviews: "6.7k",
      image: "",
    },
    {
      id: "bedding",
      category: "bedding",
      tag: "تنظيف عميق",
      title: "مفروشات وستائر وبطاطين",
      description:
        "غسالات عملاقة مخصصة ذات أسطوانة ماسية لمنع تكتل الحشو الداخلي.",
      price: 60,
      rating: 4.8,
      reviews: "5.3k",
      image: "",
    },
    {
      id: "leather",
      category: "leather",
      tag: "رعاية خاصة",
      title: "أحذية وشنط جلدية",
      description:
        "استعادة لمعان ونضارة الجلد الطبيعي، معالجة النعل الأبيض وتطهير الحذاء من الداخل للقضاء على البكتيريا.",
      price: 70,
      rating: 4.9,
      reviews: "3.8k",
      image: "",
    },
  ],
};

export const ServiceDetailsData = {
  hero: {
    badge: "جودة معتمدة عالمياً",
    title: "خدمات التنظيف الجاف الفاخر",
    description:
      "عناية فائقة بأقمشة الكشمير، الحرير، والبدل الرسمية بمحاليل صديقة للبيئة تحافظ على روعة النسيج وأناقة ألوانك الأصلية.",
    rating: "4.9",
    ordersCount: "(+500 طلب)",
    features: ["كي عمودي بالبخار", "شماعات وتغليف محكم", "معقم ومضاد للحساسية"],
  },

  filters: [
    { id: "all", label: "الكل" },
    { id: "men", label: "رجالي" },
    { id: "women", label: "نسائي" },
    { id: "bedding", label: "مفروشات" },
    { id: "formal", label: "رسمي وبدل" },
  ],
  searchPlaceholder: "ابحث عن قطعة...",
  emptyMessage: "لا توجد قطع مطابقة",
  totalLabel: "الإجمالي:",
  notInCartLabel: "غير مضاف بالسلة",
  addNoteLabel: "إضافة ملاحظة",
  notePlaceholder: "مثال: يوجد بقعة قهوة بجوار الجيب...",
  nextLabel: "تحديد موعد الخدمة",
  nextPath: "/orders/scheduling",
};

export const CartData = {
  currency: "ج.م",
  title: "سلة الطلب",
  piecesLabel: "قطع",
  emptyMessage: "السلة فارغة، أضف قطعاً من قائمة الخدمة",
  selectedLabel: "القطع المختارة",
  selectedSuffix: "قطع مختارة",
  estimatedLabel: "المجموع التقديري",
  subtotalLabel: "المجموع الفرعي للخدمات",
  deliveryLabel: "رسوم التوصيل والاستلام",
  deliveryValue: "مجاناً",

  items: [
    {
      id: "classic-shirt",
      category: ["men", "formal"],
      name: "قميص كلاسيك",
      service: "غسيل مائي لطيف + كي بالبخار",
      reviewName: "قميص كلاسيك رسمي (أبيض / كحلي)",
      reviewService: "غسيل مائي لطيف بإنزيمات حيوية + كي دقيق بالبخار الرأسي",
      reviewFeature: "منظفات خالية من الكلور المبيض",
      price: 20,
      quantity: 3,
      image: "",
    },
    {
      id: "blue-jeans",
      category: ["men", "women"],
      name: "بنطال جينز أزرق",
      service: "تثبيت لون + كوي مسطح",
      reviewName: "بنطال جينز أزرق كاجوال",
      reviewService: "تثبيت اللون وحماية الألياف + كي مسطح حراري محكم",
      reviewFeature: "مقاوم للانكماش",
      price: 25,
      quantity: 2,
      image: "",
    },
    {
      id: "winter-blanket",
      category: ["bedding"],
      name: "بطانية شتوية كبيرة",
      service: "تنظيف جاف عميق + تعطير فاخر",
      reviewName: "بطانية شتوية كبيرة مقاس كينج",
      reviewService: "تنظيف جاف عميق فائق، تعقيم حراري ضد البكتيريا ومسببات الحساسية",
      reviewFeature: "تعقيم مضاد لحشرات الفراش",
      price: 75,
      quantity: 1,
      image: "",
    },
    {
      id: "suit-jacket",
      category: ["men", "formal"],
      name: "جاكيت بدلة رسمي",
      service: "دراي كلين احترافي وحماية ألياف",
      reviewName: "جاكيت بدلة رسمي",
      reviewService: "دراي كلين احترافي وحماية ألياف",
      reviewFeature: "تغليف مضاد للتجاعيد",
      price: 65,
      quantity: 0,
      image: "",
    },
    {
      id: "polo-shirt",
      category: ["men"],
      name: "تيشيرت كاجوال / بولو",
      service: "غسيل قطني ناعم وكي خفيف",
      reviewName: "تيشيرت كاجوال / بولو",
      reviewService: "غسيل قطني ناعم وكي خفيف",
      reviewFeature: "حماية الألوان",
      price: 15,
      quantity: 0,
      image: "",
    },
    {
      id: "silk-abaya",
      category: ["women", "formal"],
      name: "عباية حرير / فستان",
      service: "تنظيف يدوي للأقمشة الحساسة",
      reviewName: "عباية حرير / فستان",
      reviewService: "تنظيف يدوي للأقمشة الحساسة",
      reviewFeature: "عناية يدوية خاصة",
      price: 45,
      quantity: 0,
      image: "",
    },
  ],
};

export const PickupSchedulingData = {
  hero: {
    badge: "خدمة الاستلام المجدول من الباب",
    title: "تحديد موعد تسليم الغسيل من باب منزلك",
    description:
      "سيصل مندوب نيفو المعتمد مع حقائب عزل الأقمشة وأجهزة التوثيق الرقمي لفرز ووزن ملابسك بكل أمانة واحترافية.",
  },

  daysTitle: "اختر يوم التسليم",
  month: "أكتوبر 2025",
  days: [
    { id: "24", label: "اليوم", day: "24", weekday: "السبت" },
    { id: "25", label: "غداً (موصى به)", day: "25", weekday: "الأحد" },
    { id: "26", label: "بعد غد", day: "26", weekday: "الإثنين" },
    { id: "27", label: "منتصف الأسبوع", day: "27", weekday: "الثلاثاء" },
    { id: "28", label: "نهاية الأسبوع", day: "28", weekday: "الأربعاء" },
  ],

  slotsTitle: "الفترات الزمنية المتاحة ليوم",
  slotsBadge: "مواعيد دقيقة بنسبة 99%",
  availableLabel: "متاحة",
  recommendedLabel: "موصى بها",
  fullLabel: "مكتملة الحجز",
  slots: [
    {
      id: "morning",
      title: "الفترة الصباحية",
      time: "10:00 AM - 01:00 PM",
      note: "الأمثل للبدء المبكر بدورة الغسيل",
      icon: "sunrise",
      recommended: true,
      available: true,
    },
    {
      id: "noon",
      title: "فترة الظهيرة",
      time: "01:00 PM - 04:00 PM",
      note: "مناسبة لأوقات العمل من المنزل",
      icon: "sun",
      recommended: false,
      available: true,
    },
    {
      id: "evening",
      title: "الفترة المسائية",
      time: "05:00 PM - 08:00 PM",
      note: "بعد انتهاء ساعات العمل الرسمية",
      icon: "sunset",
      recommended: false,
      available: true,
    },
    {
      id: "night",
      title: "الفترة الليلية",
      time: "08:00 PM - 11:00 PM",
      note: "لا توجد سيارات نيفو شاغرة في هذا الوقت",
      icon: "moon",
      recommended: false,
      available: false,
    },
  ],

  speedTitle: "موعد استلام الغسيل النظيف",
  speedSubtitle: "اختر سرعة الخدمة ووقت الاستلام",
  speeds: [
    {
      id: "normal",
      title: "عادي (24 ساعة)",
      note: "غسيل وعناية شاملة",
      priceLabel: "مجاناً مع الطلب",
      fee: 0,
    },
    {
      id: "urgent",
      title: "مستعجل (12 ساعة)",
      note: "أولوية تجفيف وكي",
      priceLabel: "+25 ج.م",
      fee: 25,
    },
  ],

  address: {
    title: "عنوان استلام الشحنة",
    addLabel: "إضافة عنوان جديد",
    name: "المنزل (المعادي)",
    defaultLabel: "الافتراضي",
    line: "المعادي الجديدة، شارع 14، برج الياسمين، الدور 4، شقة 12",
    city: "القاهرة، جمهورية مصر العربية",
    changeLabel: "تغيير العنوان",
    notesLabel: "تعليمات خاصة لمندوب الاستلام (اختياري):",
    notesPlaceholder:
      "مثال: يرجى الاتصال هاتفياً عند الوصول، أو ترك الشحنة مع أمن العمارة",
  },

  guarantee: {
    title: "ضمان حماية المقتنيات الثمينة",
    description: "فحص دقيق قبل التنظيف مع تعويض كامل حال حدوث أي ضرر.",
  },

  nextLabel: "مراجعة وتأكيد الطلب",
  nextPath: "/orders/summary",
};

export const OrderReviewData = {
  stepLabel: "الخطوة الأخيرة من الطلب",
  title: "مراجعة وتأكيد الطلب النهائي",

  items: {
    title: "قائمة القطع",
    subtitle: "بروتوكول غسيل مائي لطيف وتنظيف جاف معتمد",
    editLabel: "تعديل القطع",
    editPath: "/services/dry-clean",
    perPieceLabel: "للقطعة",
    notesTitle: "الملاحظات والتفضيلات المرفقة مع الطلب:",
    notes:
      "يُرجى تطبيق رش نشا خفيف جداً على ياقات القمصان، والتركيز على إزالة بقعة قهوة طفيفة على القميص الأبيض بجوار الجيب العلوي بعناية فائقة دون إتلاف القماش.",
  },

  schedule: {
    title: "جدول المواعيد وعنوان الاستلام والتوصيل",
    subtitle: "خدمة لوجستية دقيقة بإشراف كابتن نيفو المعتمد",
    editLabel: "تعديل",
    editPath: "/orders/scheduling",
    pickupLabel: "نافذة استلام الملابس",
    pickupStatus: "مؤكد",
    pickupDate: "الأحد، 24 أكتوبر 2025",
    pickupTime: "10:00 ص - 01:00 م (كابتن نيفو)",
    returnLabel: "موعد إرجاع الملابس نظيفة",
    returnStatus: "مجدول",
    returnDate: "الثلاثاء، 27 أكتوبر 2025",
    returnTime: "05:00 م - 08:00 م (التسليم للباب)",
    addressLabel: "عنوان المنزل المختار",
    address:
      "المعادي الجديدة، شارع 14 المتفرع من النصر، برج الياسمين السكني، الدور الرابع، شقة 42.",
    addressNote:
      "تعليمات التسليم للكابتن: الاتصال عند البوابة الرئيسية والرمز الداخلي #104.",
  },

  payment: {
    title: "خيارات وطرق الدفع المرنة",
    subtitle: "اختر الوسيلة المفضلة للسداد بدون أي رسوم إضافية",
    badge: "دفع آمن 100%",
    methods: [
      {
        id: "cash",
        title: "عند الاستلام / كارت POS",
        note: "نقداً أو ببطاقتك البنكية مع الكابتن مباشرة",
        icon: "cash",
      },
      {
        id: "card",
        title: "بطاقة ائتمان / ميزة",
        note: "فيزا، ماستركارد، كارت ميزة الوطني",
        icon: "card",
      },
      {
        id: "wallet",
        title: "فودافون كاش / إنستاباي",
        note: "تحويل فوري فودافون، أورنج، إنستاباي",
        icon: "wallet",
      },
    ],
  },

  invoice: {
    title: "ملخص الفاتورة التقديرية",
    servicesLabel: "معالجة وكي الملابس",
    deliveryLabel: "رسوم التوصيل السريع الذكي",
    deliveryValue: "مجاناً (أول طلب)",
    urgentLabel: "رسوم الخدمة المستعجلة",
    taxLabel: "الضريبة والرسوم الحكومية (14%)",
    taxValue: "مشمولة بالكامل",
    totalLabel: "الإجمالي النهائي المستحق",
    totalNote: "شامل الفحص والتوصيل",
    confirmLabel: "تأكيد وإرسال الطلب الآن",
    confirmPath: "/orders/confirmation",
    helpLabel: "مساعدة سريعة بالطلب؟",
    helpAction: "تحدث مع خدمة العملاء",
  },

  guarantee: {
    title: "ميثاق ضمان نيفو الذهبي",
    description:
      "نضمن لك نظافة وانتعاش الأقمشة بنسبة 100% مع أقصى درجات التعقيم، أو إعادة غسيل مجانية فورية دون أي تكلفة إضافية.",
    badges: ["تعقيم طبيعي آمن", "تسليم دقيق بالموعد", "دعم عملاء 24/7"],
  },
};

export const OrderConfirmationData = {
  badge: "نيفو • خدمة الغسيل الذكي",
  title: "تم تأكيد طلبك بنجاح!",
  description:
    "شكراً لثقتك في نيفو (Nivo). تم تخصيص فريق العناية بالملابس وفان التعقيم لتجهيز استلام شحنتك وفق أعلى معايير الجودة والاستدامة.",
  orderLabel: "رقم الطلب المرجعي",
  orderId: "SL-9402",
  copyLabel: "نسخ",
  copiedLabel: "تم النسخ",
  dateLabel: "تاريخ ووقت الإنشاء",
  date: "اليوم، 09:30 صباحاً",
  trackLabel: "تتبع حالة الطلب",
};

export const OrderTrackingData = {
  title: "تتبع الطلب الحي",
  status: {
    title: "جاري الغسيل والتعقيم في المغسلة",
    deliveryLabel: "التسليم المتوقع:",
    deliveryTime: "اليوم بين 07:00 م و 08:00 م",
  },

  instructions: {
    title: "تعليمات التسليم المسجلة للكابتن",
    text: "العمارة رقم 14، الدور الرابع، شقة 8. يرجى رن جرس الباب مرتين وترك الملابس معلقة على حامل المعاطف الخارجي إن لم يتم الرد خلال دقيقة.",
    changeLabel: "تغيير",
  },

  stepsTitle: "تتبع مراحل الطلب",
  stepLabel: "مرحلة",
  ofLabel: "من",
  currentStep: 2,
  steps: [
    {
      title: "تم تأكيد الطلب",
      description: "تم استلام وتأكيد طلبك بالنظام تلقائياً",
      time: "11:35 ص",
      icon: "check",
    },
    {
      title: "تم استلام الملابس",
      description: "استلمها الكابتن محمود الشامي من موقعك",
      time: "01:15 م",
      icon: "check",
    },
    {
      title: "المعالجة والغسيل الآن",
      description: "ملابسك تخضع لبرنامج الغسيل والتعقيم والكي بالبخار بعناية فائقة",
      time: "",
      icon: "washing",
    },
    {
      title: "جاهز للتوصيل والتغليف",
      description: "التغليف الحراري والتعطير الفاخر",
      time: "قيد الانتظار",
      icon: "package",
    },
    {
      title: "جاري التوصيل للمنزل",
      description: "المندوب في طريقه لعنوانك",
      time: "قيد الانتظار",
      icon: "bike",
    },
    {
      title: "تم التسليم بنجاح",
      description: "استمتع بملابسك نظيفة وجاهزة",
      time: "الخطوة الأخيرة",
      icon: "done",
    },
  ],

  driver: {
    label: "مندوب الاستلام والتوصيل",
    name: "محمود الشامي",
    initials: "م.ش",
    rating: "4.9 (+120 طلب)",
    phone: "+201000000000",
  },

  invoice: {
    title: "تفاصيل الفاتورة والأصناف",
    paidLabel: "مدفوع أونلاين",
    items: [
      { quantity: 2, name: "قميص رجالي (غسيل وكوي)", price: "30 ج.م" },
      { quantity: 1, name: "بطانية شتوية كبيرة (تعقيم خاص)", price: "75 ج.م" },
    ],
    deliveryLabel: "رسوم التوصيل والاستلام",
    deliveryValue: "مجاناً",
    totalLabel: "الإجمالي النهائي",
    totalNote: "شامل ضريبة القيمة المضافة",
    total: "105 ج.م",
  },

  support: {
    title: "هل لديك أي استفسار؟",
    description: "فريق الدعم الفني جاهز لمساعدتك فوراً",
    actionLabel: "تحدث معنا",
  },
};
