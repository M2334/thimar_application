

class Data {
  late final int id;
  late final String name, description, media;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id']??'nulData';
    name = json['name']??'nullData';
    description = json['description']??'nullData';
    media = json['media']??'nullData';
  }
}

class Links {
  late final String first, last;
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
  late final int currentPage, from, lastPage, perPage, to, total;
  late final List<Links> links;
  late final String path;

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
