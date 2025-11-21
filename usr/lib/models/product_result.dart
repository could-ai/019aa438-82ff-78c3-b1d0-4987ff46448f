class ProductResult {
  final String title;
  final String subtitle;
  final String summary;
  final String objective;
  final String targetAudience;
  final List<String> structure;
  final String contentPreview;
  final String designSuggestion;
  final List<String> variations;
  final List<String> bonuses;
  final List<String> improvements;
  final Map<String, List<String>> extraServices;

  ProductResult({
    required this.title,
    required this.subtitle,
    required this.summary,
    required this.objective,
    required this.targetAudience,
    required this.structure,
    required this.contentPreview,
    required this.designSuggestion,
    required this.variations,
    required this.bonuses,
    required this.improvements,
    required this.extraServices,
  });
}
