import 'package:flutter/material.dart';

List<Color> genreColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.indigo,
  Colors.cyan,
  Colors.brown,
  Colors.grey,
];

class Genre {
  final int id;
  final String name;
  final Color color;
  Genre({
    required this.id,
    required this.name,
    required this.color,
  });
  Genre copyWith({
    int? id,
    String? name,
    Color? color,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] as int,
      name: map['name'] as String,
      color: genreColors[map['id'] % genreColors.length],
    );
  }
  @override
  String toString() => 'Genre(id: $id, name: $name, color: $color)';
  @override
  bool operator ==(covariant Genre other) {
    if (identical(this, other)) return true;
    return other.id == id && other.name == name && other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;
}
