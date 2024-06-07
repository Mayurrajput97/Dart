import 'dart:convert';

class Doctor {
  final String name;
  final String specialization;
  final double rating;
  final String image;

  Doctor({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      rating: json['rating'].toDouble(),
      image: json['image'],
    );
  }

  static List<Doctor> fromJsonList(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((item) => Doctor.fromJson(item)).toList();
  }
}
