import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => showAboutDialog(
                  context: context,
                  applicationVersion: "1.0",
                  applicationLegalese:
                      "All rights resevered. Please dont copy me"),
              title: Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text("About this app...."),
            ),
            AboutListTile(),
          ],
        ));
  }
}
