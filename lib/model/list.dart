class ListModel {
  final int id;
  final String name;
  final List items;

  ListModel({
    required this.id,
    required this.name,
    required this.items,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'],
      name: json['name'],
      items: json['items'],
    );
  }

}
