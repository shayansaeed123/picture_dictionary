class itemModel {
  String? typeId;
  String? typeName;
  int? totalItems;
  List<Items>? items;

  itemModel({this.typeId, this.typeName, this.totalItems, this.items});

  itemModel.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    typeName = json['type_name'];
    totalItems = json['total_items'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['type_name'] = this.typeName;
    data['total_items'] = this.totalItems;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? english;
  String? englishVoice;
  String? turkish;
  String? turkishVoice;
  String? urdu;
  String? urduVoice;
  String? arabic;
  String? arabicVoice;
  String? typeId;
  String? type;
  String? image;

  Items(
      {this.id,
      this.english,
      this.englishVoice,
      this.turkish,
      this.turkishVoice,
      this.urdu,
      this.urduVoice,
      this.arabic,
      this.arabicVoice,
      this.typeId,
      this.type,
      this.image});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    english = json['english'];
    englishVoice = json['english_voice'];
    turkish = json['turkish'];
    turkishVoice = json['turkish_voice'];
    urdu = json['urdu'];
    urduVoice = json['urdu_voice'];
    arabic = json['arabic'];
    arabicVoice = json['arabic_voice'];
    typeId = json['type_id'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['english'] = this.english;
    data['english_voice'] = this.englishVoice;
    data['turkish'] = this.turkish;
    data['turkish_voice'] = this.turkishVoice;
    data['urdu'] = this.urdu;
    data['urdu_voice'] = this.urduVoice;
    data['arabic'] = this.arabic;
    data['arabic_voice'] = this.arabicVoice;
    data['type_id'] = this.typeId;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }
}
