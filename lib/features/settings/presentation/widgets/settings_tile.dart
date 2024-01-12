import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const SettingsTile({required this.onTap, required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        onTap: onTap,
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.lock,
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!,
          overflow:
          TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.navigate_next),
      ),
    );
  }
}