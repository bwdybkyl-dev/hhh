# المستشار التعليمي الذكي

منصة Flutter عربية (RTL) لإدارة رحلة الطالب التعليمية: حسابات وصلاحيات، اختبارات تعتمد على Firestore، توصيات تخصصات، مستشارون، استشارات، مواعيد، محادثات فورية، مرفقات، إشعارات وتقارير.

## المعمارية

`UI → Riverpod Controller → Repository → Firebase Data Source → Firebase`.

- `lib/core`: الثيم، التوجيه والتحقق ومعالجة الأخطاء.
- `lib/data/models`: نموذج واحد لكل كيان Firestore.
- `lib/data/repositories`: وصول Firebase خارج الواجهات.
- `lib/services`: منطق التوصيات والتقييمات والتخزين والإشعارات ومزود الاتصال.
- `lib/features`: شاشات مستقلة للمصادقة والطالب والمستشار والإدارة.
- `functions`: Cloud Functions لإشعارات الرسائل ومهام الخادم.

## Firestore schema

| Collection | Purpose |
|---|---|
| `users`, `students`, `advisors` | الهوية، الدور، والملفات المتخصصة |
| `majors`, `assessments`, `assessments/{id}/questions` | كتالوج التخصصات والاختبارات الديناميكية |
| `assessment_results`, `recommendations` | النتائج والتحليل |
| `consultations`, `appointments` | طلبات الاستشارة والحجوزات |
| `conversations/{id}/messages/{id}` | محادثات real-time، ردود، ومرفقات |
| `notifications`, `calls`, `system_metrics` | التنبيهات وسجل المكالمات وإحصاءات الإدارة |

## إعداد Firebase

1. شغّل `flutterfire configure` لإنشاء إعدادات Firebase الخاصة بمشروعك ثم أضف ملفات Android/iOS/Web الناتجة (لا تُرفع مفاتيح الخدمة).
2. فعّل Authentication بالبريد/كلمة المرور، Firestore، Storage، Cloud Messaging وApp Check في Firebase.
3. انشر قواعد الأمان والفهارس: `firebase deploy --only firestore,storage`.
4. ثبّت وشغّل Functions: `cd functions && npm install && npm run deploy`.
5. أنشئ وثيقة `system_metrics/current` لتغذية لوحة الإدارة؛ تقوم Functions/وظائف الإدارة بتحديثها على الخادم.

## التشغيل والاختبار

```bash
flutter pub get
flutter run
flutter test
flutter analyze
```

تتطلب المكالمات ربط تطبيق فعلي لـ `CallProvider` (WebRTC أو مزود اتصالات)؛ الواجهة لا تدّعي نجاح الاتصال قبل تأكيد المزود.
