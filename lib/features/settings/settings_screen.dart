import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
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
          Checkbox(value: _notifications, onChanged: _onNotificationChanged),
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
              print(date);

              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
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
              print(booking);
            },
            title: Text("what is your birthday?"),
          ),
          AboutListTile(),
        ],
      ),
    );
  }
}
