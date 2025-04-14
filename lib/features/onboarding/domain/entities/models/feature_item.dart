class FeatureItem {
  final String title;
  final String iconPath;

  const FeatureItem({required this.title, required this.iconPath});

  @override
  String toString() => 'FeatureItem(title: $title, iconPath: $iconPath)';
}
