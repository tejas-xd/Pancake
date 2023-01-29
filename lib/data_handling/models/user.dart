
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
        favorite!.add(new Favorite.fromJson(v));
      });
    }
    if (json['watchlist'] != null) {
      watchlist = <Favorite>[];
      json['watchlist'].forEach((v) {
        watchlist!.add(new Favorite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['name'] = this.name;
    if (this.favorite != null) {
      data['favorite'] = this.favorite!.map((v) => v.toJson()).toList();
    }
    if (this.watchlist != null) {
      data['watchlist'] = this.watchlist!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
