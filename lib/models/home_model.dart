class HomeModel {
  late bool status;
  late HomeDataModel data;
  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  String? ad;
  List<BannerModel> bannerList = [];
  List<ProductModel> productList = [];
  
  HomeDataModel.fromJson(Map<String, dynamic> json){
    ad = json['ad'];
    
    json['banners'].forEach((element) {
      bannerList.add(BannerModel.fromJson(element));
    });
    
    json['products'].forEach((element) {
      productList.add(ProductModel.fromJson(element));
    });
  }
}

class ProductModel {

  late int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;

  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    inCart = json['in_cart'];
    inFavorites = json['in_favorites'];
  }
}

class BannerModel {
  late int id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
  }

}
