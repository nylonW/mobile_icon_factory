class Contents {
  List<Image> images;
  Info info;

  Contents({required this.images, required this.info});

  static Contents standard = Contents(
    images: [
      Image(idiom: 'iphone', size: 20, scale: 2),
      Image(idiom: 'iphone', size: 20, scale: 3),
      Image(idiom: 'ipad', size: 20, scale: 1),
      Image(idiom: 'ipad', size: 20, scale: 2),
      Image(idiom: 'iphone', size: 29, scale: 2),
      Image(idiom: 'iphone', size: 20, scale: 3),
      Image(idiom: 'iphone', size: 40, scale: 2),
      Image(idiom: 'iphone', size: 40, scale: 3),
      Image(idiom: 'iphone', size: 60, scale: 2),
      Image(idiom: 'iphone', size: 60, scale: 3),
      Image(idiom: 'ipad', size: 29, scale: 1),
      Image(idiom: 'ipad', size: 29, scale: 2),
      Image(idiom: 'ipad', size: 40, scale: 1),
      Image(idiom: 'ipad', size: 40, scale: 2),
      Image(idiom: 'ipad', size: 76, scale: 1),
      Image(idiom: 'ipad', size: 76, scale: 2),
      Image(idiom: 'ipad', size: 83.5, scale: 2),
      Image(idiom: 'ios-marketing', size: 1024, scale: 1),
    ],
    info: Info(author: 'xcode', version: 1),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images.map((v) => v.toJson()).toList();
    data['info'] = info.toJson();
    return data;
  }
}

class Image {
  double imageSize;
  double size;
  String idiom;
  late String filename;
  int scale;

  Image({required this.size, required this.idiom, required this.scale})
      : imageSize = size * scale {
    filename = 'icon-$size@$scale.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = '${size}x$size';
    data['idiom'] = idiom;
    data['filename'] = filename;
    data['scale'] = '${scale}x$scale';
    return data;
  }
}

class Info {
  int? version;
  String? author;

  Info({this.version, this.author});

  Info.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['author'] = author;
    return data;
  }
}
