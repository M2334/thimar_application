class ProductData {
  late final List<DataModel> data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;
  late final int userCartCount;
  late final double maxPrice;
  late final double minPrice;

  ProductData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => DataModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
    userCartCount = json['user_cart_count'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
  }
}

class DataModel {
  late final num categoryId;
  late final num id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num? price;
  late final num discount;
  late final num amount;
  late final num isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  DataModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id']??'';
    id = json['id']??'';
    title = json['title']??'';
    description = json['description']??'';
    code = json['code']??'';
    priceBeforeDiscount = json['price_before_discount']??'';
    price = json['price']??'';
    discount = json['discount']??'';
    amount = json['amount']??'';
    isActive = json['is_active']??'';
    isFavorite = json['is_favorite']??'';
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image']??'';
    createdAt = json['created_at']??'';
  }
}

class Unit {
  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id']??'';
    name = json['name']??'';
    type = json['type']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name']??'';
    url = json['url']??'';
  }
}

class Links {
  late final String first;
  late final String last;
  late final void prev;
  late final void next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}

class Meta {
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}
