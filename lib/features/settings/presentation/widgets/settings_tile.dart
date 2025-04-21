import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showDivider;
  final Color? backgroundColor;
  final EdgeInsets? margin;

  const SettingsTile({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
    this.showDivider = true,
    this.backgroundColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Material(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: margin != null ? BorderRadius.circular(12) : null,
            child: ListTile(
              title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
              trailing:
                  trailing is Row
                      ? ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: trailing!,
                      )
                      : trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: onTap,
            ),
          ),
          if (showDivider)
            const Divider(height: 1, thickness: 0.5, color: Colors.grey, indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}
