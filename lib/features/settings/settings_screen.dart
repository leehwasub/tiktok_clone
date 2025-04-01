import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/widgets/video_configuration/video_config.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';

import '../../constants/sizes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Localizations.override(
      context: context,
      locale: Locale("ko"),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(
          child: Container(
            decoration: width > Breakpoints.md
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.size1),
                    border: Border.all(
                        color: Colors.grey.shade300, width: Sizes.size1),
                  )
                : null,
            constraints: BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: ListView(
              children: [
                ValueListenableBuilder(
                  valueListenable: videoConfig,
                  builder: (context, value, child) => SwitchListTile.adaptive(
                    title: Text("Auto Mute"),
                    subtitle: Text("Videos will be mutded by default"),
                    value: value,
                    onChanged: (value) {
                      videoConfig.value = !videoConfig.value;
                    },
                  ),
                ),
                SwitchListTile.adaptive(
                  title: Text("Enable Notirications"),
                  subtitle: Text("Enable"),
                  value: _notifications,
                  onChanged: _onNotificationChanged,
                ),
                Switch.adaptive(
                    value: _notifications, onChanged: _onNotificationChanged),
                CupertinoSwitch(
                    value: _notifications, onChanged: _onNotificationChanged),
                SwitchListTile(
                  title: Text("Enable Notirications"),
                  value: _notifications,
                  onChanged: _onNotificationChanged,
                ),
                Checkbox(
                    value: _notifications, onChanged: _onNotificationChanged),
                CheckboxListTile(
                  activeColor: Colors.black,
                  value: _notifications,
                  onChanged: _onNotificationChanged,
                  title: Text("Enable notification"),
                ),
                ListTile(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2030),
                    );

                    if (!mounted) return;

                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    final booking = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            appBarTheme: AppBarTheme(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                  },
                  title: Text("what is your birthday?"),
                ),
                ListTile(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("Are you Sure?"),
                        content: Text("Please dont go."),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("No"),
                          ),
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            isDestructiveAction: true,
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  title: Text("Log out (IOS)"),
                  textColor: Colors.red,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: FaIcon(FontAwesomeIcons.skull),
                        title: Text("Are you Sure?"),
                        content: Text("Please dont go."),
                        actions: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: FaIcon(FontAwesomeIcons.car),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  title: Text("Log out (Android)"),
                  textColor: Colors.red,
                ),
                ListTile(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: Text("Are you Sure?"),
                        message: Text("Please dont gooooo"),
                        actions: [
                          CupertinoActionSheetAction(
                            isDefaultAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Not Log out"),
                          ),
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("YEs Plz"),
                          ),
                        ],
                      ),
                    );
                  },
                  title: Text("Log out (IOS/Bottom)"),
                  textColor: Colors.red,
                ),
                AboutListTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
