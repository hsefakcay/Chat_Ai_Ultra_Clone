import 'package:flutter/material.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Ayarlar',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsTile(
                title: 'Giriş Yap',
                onTap: () {},
                showDivider: false,
                backgroundColor: Colors.grey.shade900,
                margin: const EdgeInsets.only(bottom: 16),
              ),
              const SettingsSection(
                title: 'Genel',
                children: [
                  SettingsTile(
                    title: 'Kullanıcı Kimliği',
                    trailing: Row(
                      children: [
                        Text(
                          '1a838d09-64fe-...',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Icon(Icons.copy, color: Colors.grey, size: 20),
                      ],
                    ),
                  ),
                  SettingsTile(
                    title: 'Dil',
                    trailing: Text('Türkçe', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ),
                  SettingsTile(title: 'Yazı Tipi Boyutu'),
                  SettingsTile(title: 'Parlaklık'),
                  SettingsTile(title: 'Bize Puan Ver'),
                  SettingsTile(title: 'Uygulamayı Paylaş'),
                ],
              ),
              const SettingsSection(
                title: 'Yardım Merkezi',
                children: [
                  SettingsTile(title: 'Destek ile Sohbet Et'),
                  SettingsTile(title: 'SSS ve Destek'),
                  SettingsTile(title: 'Gizlilik Politikası'),
                  SettingsTile(title: 'Şartlar ve Koşullar'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bildirim', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Switch(value: true, onChanged: null, activeColor: Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
