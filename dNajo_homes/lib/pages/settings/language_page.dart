import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile(
                  title: 'Adai',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Afrikaans',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Albaamaha',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'العربية',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Arbërisht',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Bamanankan',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: ' बड़ो',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: ' 廣東話',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Chamoru',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Chikasha',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Dansk',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Deutsch',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Eesti',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'English',
                  trailing: const Icon(Icons.check),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Espagnol',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'эвэн то̄рэ̄нни or эвэды',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Fala',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Furlan',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: '赣语, 贛語',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Ελληνικά',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: ' 𐌲𐌿𐍄𐌹𐍃𐌺',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: ' ქართული',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'हिन्दुस्तानी',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: '日本語',
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Līvõ Kēļ or Rāndakēļ',
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
