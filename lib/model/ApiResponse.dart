class ApiResponse {
  int? userId;
  int? id;
  String? title;

  ApiResponse({
      this.userId,
      this.id, 
      this.title,});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        userId : json['userId'],
        id : json['id'],
        title : json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}