import 'package:shared_preferences/shared_preferences.dart';
import '../models/onboarding_model.dart';

abstract class OnboardingLocalDataSource {
  Future<OnboardingModel> getOnboardingPages();
  Future<void> saveOnboardingCompleted();
  Future<bool> isOnboardingCompleted();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String onboardingCompletedKey = 'ONBOARDING_COMPLETED';

  OnboardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<OnboardingModel> getOnboardingPages() async {
    // Bu veriyi normalde bir json dosyasından veya API'den alacağız
    // Şimdilik hard-coded olarak tutalım
    final Map<String, dynamic> jsonData = {
      "pages": [
        {
          "type": "welcome",
          "title": "ChatAI Ultra",
          "description": "Cebinizdeki Yapay Zeka Asistanı",
          "imagePath": "assets/images/logo.png",
        },
        {
          "type": "features",
          "title": "Çeşitli Yapay Zeka Araçları",
          "features": [
            {"title": "Görüntü Oluşturma", "iconPath": "assets/images/CreateImage.png"},
            {"title": "E-posta Oluşturma", "iconPath": "assets/images/createEmail.png"},
            {"title": "Resim İste", "iconPath": "assets/images/wantImage.png"},
            {"title": "Web Özetleyici", "iconPath": "assets/images/web.png"},
          ],
        },
        {
          "type": "reviews",
          "title": "Mutlu Kullanıcılarımıza Katılın",
          "reviews": [
            {
              "title": "E-postalar Zahmetsiz",
              "description":
                  "ChatAI Ultra ile zahmetsizce profesyonel ve etkili e-postalar yazıyorum!",
              "stars": 5,
            },
            {
              "title": "Sınırsız Yaratıcılık",
              "description":
                  "ChatAI Ultra ile içeriklerim daha etkileyici ve yaratıcı hale geliyor!",
              "stars": 5,
            },
            {
              "title": "Akademik Yazılar İçin",
              "description":
                  "ChatAI Ultra ile özgün denemeler yazıyor, testlerden kolayca geçiyorum!",
              "stars": 5,
            },
          ],
        },
        {
          "type": "pricing",
          "title": "PRO",
          "description": "Erişim AI",
          "features": [
            {"title": "Sınırsız Mesajlar", "iconPath": "chat"},

            {
              "title": "DeepSeek, GPT-4o, Grok, Gemini ve Claude'dan cevaplar",
              "iconPath": "answer",
            },
            {"title": "Görüntü Oluşturma", "iconPath": "image"},
          ],
          "pricingItems": [
            {"title": "1 Hafta", "price": "₺249.99"},
            {
              "title": "1 Yıl",
              "price": "₺1299.99",
              "subtitle": "₺24.93 \nhaftada",
              "isHighlighted": true,
            },
            {"title": "Ömür Boyu", "price": "₺2299.99", "subtitle": "tek seferlik"},
          ],
        },
      ],
    };

    return OnboardingModel.fromJson(jsonData);
  }

  @override
  Future<void> saveOnboardingCompleted() async {
    await sharedPreferences.setBool(onboardingCompletedKey, true);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return sharedPreferences.getBool(onboardingCompletedKey) ?? false;
  }
}
