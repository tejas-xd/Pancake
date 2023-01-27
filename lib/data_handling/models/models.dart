
class Mixed {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  double? voteAverage;

  Mixed({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.voteAverage,
  });

  Mixed.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    if (title == null) {
      title = json['name'];
    }
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    if (title == null) {
      originalTitle = json['original_name'];
    }
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['title'] = this.title;
    if (title == null) {
      data['name'] = this.title;
    }

    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    if (title == null) {
      data['original_name'] = this.originalTitle;
    }

    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['vote_average'] = this.voteAverage;
    return data;
  }
}

class Movie {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;

  Movie({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    return data;
  }
}

class TVshow {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? posterPath;

  TVshow({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.posterPath,
  });

  TVshow.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['name'] = this.name;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['poster_path'] = this.posterPath;
    return data;
  }
}

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class TVimbd {
  int? id;

  TVimbd(
      {
        this.id,
        });

  TVimbd.fromJson(Map<String, dynamic> json) {

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Seasondata {
  String? sId;
  String? airDate;
  List<Episodes>? episodes;
  String? name;
  String? overview;
  int? id;
  String? posterPath;
  int? seasonNumber;

  Seasondata(
      {this.sId,
        this.airDate,
        this.episodes,
        this.name,
        this.overview,
        this.id,
        this.posterPath,
        this.seasonNumber});

  Seasondata.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    airDate = json['air_date'];
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
    name = json['name'];
    overview = json['overview'];
    id = json['id'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['air_date'] = this.airDate;
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['id'] = this.id;
    data['poster_path'] = this.posterPath;
    data['season_number'] = this.seasonNumber;
    return data;
  }
}

class Episodes {
  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  double? voteAverage;
  int? voteCount;
  List<Crew>? crew;
  List<GuestStars>? guestStars;

  Episodes(
      {this.airDate,
        this.episodeNumber,
        this.id,
        this.name,
        this.overview,
        this.productionCode,
        this.runtime,
        this.seasonNumber,
        this.showId,
        this.stillPath,
        this.voteAverage,
        this.voteCount,
        this.crew,
        this.guestStars});

  Episodes.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(new Crew.fromJson(v));
      });
    }
    if (json['guest_stars'] != null) {
      guestStars = <GuestStars>[];
      json['guest_stars'].forEach((v) {
        guestStars!.add(new GuestStars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['production_code'] = this.productionCode;
    data['runtime'] = this.runtime;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    if (this.crew != null) {
      data['crew'] = this.crew!.map((v) => v.toJson()).toList();
    }
    if (this.guestStars != null) {
      data['guest_stars'] = this.guestStars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Crew {
  String? department;
  String? job;
  String? creditId;
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;

  Crew(
      {this.department,
        this.job,
        this.creditId,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath});

  Crew.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    job = json['job'];
    creditId = json['credit_id'];
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['job'] = this.job;
    data['credit_id'] = this.creditId;
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class GuestStars {
  String? character;
  String? creditId;
  int? order;
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;

  GuestStars(
      {this.character,
        this.creditId,
        this.order,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath});

  GuestStars.fromJson(Map<String, dynamic> json) {
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    return data;
  }
}
