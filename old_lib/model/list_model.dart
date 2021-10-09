class ListModel {
  final int id;
  final String name;
  final List items;
  final List editors;
  final List viewers;

  ListModel({
    required this.id,
    required this.name,
    required this.items,
    required this.editors,
    required this.viewers,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'],
      name: json['name'],
      items: json['items'],
      editors: json['editors'],
      viewers: json['viewers'],
    );
  }
}
