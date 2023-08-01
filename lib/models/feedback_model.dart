

class FeedBackModel {
  final int id;
  final String name;
  final String description;
  FeedBackModel({required this.id,required this.name,required this.description});
  factory FeedBackModel.fromJson(Map<String, dynamic> json) {
    return FeedBackModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}