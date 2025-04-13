class CatListItemModel<T> {
  final String label;
  final T value;
  final String? suffix;

  const CatListItemModel({
    required this.label,
    required this.value,
    this.suffix,
  });
}
