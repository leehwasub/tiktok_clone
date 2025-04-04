import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_configuration/video_config.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

import '../../constants/sizes.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                SwitchListTile.adaptive(
                  title: Text("Mute video"),
                  subtitle: Text("Videos will be muted by default."),
                  value: ref.watch(playbackConfigProvider).muted,
                  onChanged: (value) => {
                    ref.read(playbackConfigProvider.notifier).setMuted(value)
                  },
                ),
                SwitchListTile.adaptive(
                  title: Text("Autoplay"),
                  subtitle: Text("Videos will be muted by default."),
                  value: ref.watch(playbackConfigProvider).autoplay,
                  onChanged: (value) => {
                    ref.read(playbackConfigProvider.notifier).setAutoplay(value)
                  },
                ),
                SwitchListTile.adaptive(
                  title: Text("Enable Notirications"),
                  subtitle: Text("Enable"),
                  value: false,
                  onChanged: (value) {},
                ),
                Switch.adaptive(value: false, onChanged: (value) {}),
                CupertinoSwitch(value: false, onChanged: (value) {}),
                SwitchListTile(
                  title: Text("Enable Notirications"),
                  value: false,
                  onChanged: (value) {},
                ),
                Checkbox(value: false, onChanged: (value) {}),
                CheckboxListTile(
                  activeColor: Colors.black,
                  value: false,
                  onChanged: (value) {},
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
                            onPressed: () {
                              ref.read(authRepo).signOut();
                              context.go("/");
                            },
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
