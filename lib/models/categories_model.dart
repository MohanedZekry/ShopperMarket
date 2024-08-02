class CategoriesModel {
  late bool status;
  late CategoriesDataModel data;
  CategoriesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
}

class CategoriesDataModel {

  late int currentPage;
  late int perPage;
  late int total;
  late int toPage;
  late int from;

  List<CategoriesInnerDataModel> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    perPage = json['per_page'];
    total = json['total'];
    toPage = json['to'];
    from = json['from'];

    json['data'].forEach((element) {
        data.add(CategoriesInnerDataModel.fromJson(element));
    });

  }
}

class CategoriesInnerDataModel {

  late int id;
  late String image;
  late String name;

  CategoriesInnerDataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }
}