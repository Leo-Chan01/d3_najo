import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '/utils/constants.dart';
import 'language_page.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Settings',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'General',
            titleTextStyle: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titlePadding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            tiles: [
              SettingsTile(
                title: 'Language',
                leading: const Icon(
                  Icons.language,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LanguagePage();
                      },
                    ),
                  );
                },
              ),
              SettingsTile(
                title: 'Display & Sounds',
                leading: const Icon(
                  Icons.desktop_access_disabled_sharp,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Push Notifications',
                leading: const Icon(Icons.notifications),
                switchValue: true,
                switchActiveColor: kPrimaryColor,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Dark Mode',
                leading: const Icon(Icons.mode_night_outlined),
                switchValue: true,
                switchActiveColor: kPrimaryColor,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            titleTextStyle: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titlePadding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            tiles: [
              SettingsTile(
                title: 'Privacy',
                leading: const Icon(
                  Icons.privacy_tip,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Upload your informations',
                leading: const Icon(
                  Icons.upload,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: const Icon(Icons.fingerprint),
                switchValue: true,
                switchActiveColor: kPrimaryColor,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Others',
            titleTextStyle: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titlePadding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            tiles: [
              SettingsTile(
                title: 'Personal history',
                leading: const Icon(
                  Icons.list,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'community standard',
                leading: const Icon(
                  Icons.checklist_rounded,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Help',
                leading: const Icon(
                  Icons.help,
                ),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
