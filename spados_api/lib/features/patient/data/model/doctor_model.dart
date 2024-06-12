import 'dart:convert';

class Doctor {
  final String name;
  final String specialization;
  final double rating;
  final String image;
  final String description;
  final List<String> availableSlots;
  final List<String> education;

  Doctor({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.image,
    required this.description,
    required this.availableSlots,
    required this.education,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      rating: json['rating'].toDouble(),
      image: json['image'],
      description: json['description'],
      availableSlots: List<String>.from(json['availableSlots']),
      education: List<String>.from(json['education']),
    );
  }

  static List<Doctor> fromJsonList(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((item) => Doctor.fromJson(item)).toList();
  }
}
