import 'dart:convert';

import 'package:flutter/foundation.dart';

class ReasonsList {
  List<Reasons> reasons;
  ReasonsList({
    this.reasons,
  });

  ReasonsList copyWith({
    List<Reasons> reasons,
  }) {
    return ReasonsList(
      reasons: reasons ?? this.reasons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reasons': reasons?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ReasonsList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ReasonsList(
      reasons: List<Reasons>.from(map['reasons']?.map((x) => Reasons.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReasonsList.fromJson(String source) => ReasonsList.fromMap(json.decode(source));

  @override
  String toString() => 'ReasonsList(reasons: $reasons)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ReasonsList &&
      listEquals(o.reasons, reasons);
  }

  @override
  int get hashCode => reasons.hashCode;
}

class Reasons {
  int id;
  String title;
  String desc;
  String image;
  String color;
  Reasons({
    this.id,
    this.title,
    this.desc,
    this.image,
    this.color,
  });

  Reasons copyWith({
    int id,
    String title,
    String desc,
    String image,
    String color,
  }) {
    return Reasons(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'image': image,
      'color': color,
    };
  }

  factory Reasons.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Reasons(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
      image: map['image'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reasons.fromJson(String source) =>
      Reasons.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reasons(id: $id, title: $title, desc: $desc, image: $image, color: $color)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Reasons &&
        o.id == id &&
        o.title == title &&
        o.desc == desc &&
        o.image == image &&
        o.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        desc.hashCode ^
        image.hashCode ^
        color.hashCode;
  }
}
