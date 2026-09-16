import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Current selections
  String language = 'English';
  String environment = 'Production';
  String platform = 'Default';

  bool customTheme = false;
  bool lockApp = true;
  bool fingerprint = true;
  bool notifications = true;
  bool changePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        children: [
          const SectionTitle('Common'),
          SettingContainer(
            children: [
              SettingRow(
                icon: Icons.language,
                title: 'Language',
                trailing: language,
                onTap: () {
                  setState(() {
                    language = language == 'English' ? 'Vietnamese' : 'English';
                  });
                },
              ),
              SettingRow(
                icon: Icons.cloud_queue,
                title: 'Environment',
                trailing: environment,
                onTap: () {
                  setState(() {
                    environment = environment == 'Production'
                        ? 'Development'
                        : 'Production';
                  });
                },
              ),
              SettingRow(
                icon: Icons.devices,
                title: 'Platform',
                trailing: platform,
                onTap: () {
                  setState(() {
                    platform = platform == 'Default' ? 'Mobile' : 'Default';
                  });
                },
              ),
              SettingRow(
                icon: Icons.format_paint,
                title: 'Enable custom theme',
                trailingWidget: Switch(
                  value: customTheme,
                  activeTrackColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      customTheme = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const SectionTitle('Account'),
          SettingContainer(
            children: [
              SettingRow(
                icon: Icons.phone,
                title: 'Phone number',
                onTap: () {
                  showMessage('Phone number selected');
                },
              ),
              SettingRow(
                icon: Icons.email,
                title: 'Email',
                onTap: () {
                  showMessage('Email selected');
                },
              ),
              SettingRow(
                icon: Icons.logout,
                title: 'Sign out',
                onTap: () {
                  showMessage('Sign out selected');
                },
              ),
            ],
          ),
          const SizedBox(height: 18),
          const SectionTitle('Security'),
          SettingContainer(
            children: [
              SettingRow(
                icon: Icons.lock,
                title: 'Lock app in background',
                trailingWidget: Switch(
                  value: lockApp,
                  activeTrackColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      lockApp = value;
                    });
                  },
                ),
              ),
              SettingRow(
                icon: Icons.fingerprint,
                title: 'Use fingerprint',
                trailingWidget: Switch(
                  value: fingerprint,
                  activeTrackColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      fingerprint = value;
                    });
                  },
                ),
              ),
              SettingRow(
                icon: Icons.lock_outline,
                title: 'Change password',
                trailingWidget: Switch(
                  value: changePassword,
                  activeTrackColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      changePassword = value;
                    });
                  },
                ),
              ),
              SettingRow(
                icon: Icons.notifications,
                title: 'Enable notifications',
                trailingWidget: Switch(
                  value: notifications,
                  activeTrackColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        bottom: 5,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class SettingContainer extends StatelessWidget {
  final List<Widget> children;

  const SettingContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const SettingRow({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              // Icon
              Icon(
                icon,
                size: 17,
                color: Colors.grey,
              ),

              const SizedBox(width: 10),

              // Setting name
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),

              // Text value
              if (trailing != null)
                Text(
                  trailing!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),

              // Switch or other widget
              if (trailingWidget != null) trailingWidget!,

              // Arrow
              if (onTap != null && trailingWidget == null)
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
