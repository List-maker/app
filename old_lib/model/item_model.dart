class ItemModel {
  final int id;
  final String name;
  final bool checked;

  ItemModel({
    required this.id,
    required this.name,
    required this.checked,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      checked: json['checked'],
    );
  }
}
