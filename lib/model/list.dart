class ListModel {
  final int id;
  final String name;
  final List items;

  ListModel(this.id, this.name, this.items);

  ListModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        items = json['items'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'items': items,
  };
}