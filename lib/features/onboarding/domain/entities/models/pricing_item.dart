class PricingItem {
  final String title;
  final String price;
  final String? subtitle;
  final bool isHighlighted;

  const PricingItem({
    required this.title,
    required this.price,
    this.subtitle,
    this.isHighlighted = false,
  });
}
