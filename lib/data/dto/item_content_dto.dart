class ItemContentDTO {
  String? slug;
  String? id;
  String? title;
  String? html;
  String? commentId;
  String? featureImage;
  String? visibility;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? url;
  String? excerpt;

  ItemContentDTO({
    this.slug,
    this.id,
    this.title,
    this.html,
    this.commentId,
    this.featureImage,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.url,
    this.excerpt,
  });

  ItemContentDTO.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    id = json['id'];
    title = json['title'];
    html = json['html'];
    commentId = json['comment_id'];
    featureImage = json['feature_image'];
    visibility = json['visibility'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    url = json['url'];
    excerpt = json['excerpt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['id'] = id;
    data['title'] = title;
    data['html'] = html;
    data['comment_id'] = commentId;
    data['feature_image'] = featureImage;
    data['visibility'] = visibility;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['published_at'] = publishedAt;
    data['url'] = url;
    data['excerpt'] = excerpt;
    return data;
  }
}
