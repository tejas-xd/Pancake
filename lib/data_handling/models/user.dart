
class Users {
  String? email;
  String? name;
  List<Favorite>? favorite;
  List<Favorite>? watchlist;

  Users({this.email, this.name, this.favorite, this.watchlist});

  Users.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    name = json['name'];
    if (json['favorite'] != null) {
      favorite = <Favorite>[];
      json['favorite'].forEach((v) {
        favorite!.add(Favorite.fromJson(v));
      });
    }
    if (json['watchlist'] != null) {
      watchlist = <Favorite>[];
      json['watchlist'].forEach((v) {
        watchlist!.add(Favorite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['name'] = name;
    if (favorite != null) {
      data['favorite'] = favorite!.map((v) => v.toJson()).toList();
    }
    if (watchlist != null) {
      data['watchlist'] = watchlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorite {
  String? image;
  int? id;
  String? type;

  Favorite({this.image, this.id, this.type});

  Favorite.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
