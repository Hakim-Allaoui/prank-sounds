class DataModel {
  DataModel({
    required this.categories,
    required this.ads,
    required this.config,
  });

  late final List<Category> categories;
  late final Ads ads;
  late final Config config;

  DataModel.fromJson(Map<String, dynamic> json) {
    categories =
        List.from(json['categories']).map((e) => Category.fromJson(e)).toList();
    ads = Ads.fromJson(json['ads']);
    config = Config.fromJson(json['config']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    _data['ads'] = ads.toJson();
    _data['config'] = config.toJson();
    return _data;
  }
}

class Category {
  Category({
    required this.title,
    required this.cover,
    required this.audios,
  });

  late final String title;
  late final String cover;
  late final List<Audio> audios;

  Category.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cover = json['cover'];
    audios = List.from(json['audios']).map((e) => Audio.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['cover'] = cover;
    _data['audios'] = audios.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Audio {
  Audio({
    required this.title,
    required this.url,
    required this.cover,
  });

  late final String title;
  late final String url;
  late final String cover;

  Audio.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['url'] = url;
    _data['cover'] = cover;
    return _data;
  }
}

class Ads {
  Ads({
    required this.adNetwork,
    required this.ids,
  });

  late final String adNetwork;
  late final Ids ids;

  Ads.fromJson(Map<String, dynamic> json) {
    adNetwork = json['adNetwork'];
    ids = Ids.fromJson(json['ids']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adNetwork'] = adNetwork;
    _data['ids'] = ids.toJson();
    return _data;
  }
}

class Ids {
  Ids({
    required this.appId,
    required this.banner,
    required this.inter,
    required this.reward,
    required this.native,
    required this.mRec,
    required this.appOpen,
  });

  late final String appId;
  late final String banner;
  late final String inter;
  late final String reward;
  late final String native;
  late final String mRec;
  late final String appOpen;

  Ids.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    banner = json['banner'];
    inter = json['inter'];
    reward = json['reward'];
    native = json['native'];
    mRec = json['mRec'];
    appOpen = json['appOpen'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['appId'] = appId;
    _data['banner'] = banner;
    _data['inter'] = inter;
    _data['reward'] = reward;
    _data['native'] = native;
    _data['mRec'] = mRec;
    _data['appOpen'] = appOpen;
    return _data;
  }
}

class Config {
  Config({
    required this.currentAppVersion,
    required this.forceUpdate,
    required this.title,
    required this.body,
    required this.updateLink,
    required this.approved,
  });

  late final String currentAppVersion;
  late final bool forceUpdate;
  late final String title;
  late final String body;
  late final String updateLink;
  late final bool approved;

  Config.fromJson(Map<String, dynamic> json) {
    currentAppVersion = json['currentAppVersion'];
    forceUpdate = json['forceUpdate'];
    title = json['title'];
    body = json['body'];
    updateLink = json['updateLink'];
    approved = json['approved'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentAppVersion'] = currentAppVersion;
    _data['forceUpdate'] = forceUpdate;
    _data['title'] = title;
    _data['body'] = body;
    _data['updateLink'] = updateLink;
    _data['approved'] = approved;
    return _data;
  }
}
