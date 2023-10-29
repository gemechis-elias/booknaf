class BookModel {
  String? sId;
  String? category;
  String? title;
  String? description;
  String? duration;
  String? image;
  double? rating;
  String? createdAt;
  int? iV;
  String? id;

  BookModel(
      {this.sId,
      this.category,
      this.title,
      this.description,
      this.duration,
      this.image,
      this.rating,
      this.createdAt,
      this.iV,
      this.id});

  BookModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    image = json['image'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['title'] = this.title;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
