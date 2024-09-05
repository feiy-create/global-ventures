// lib/models/destination.dart
class Destination {
  final String city;
  final String country;
  final String imageUrl;

  Destination({
    required this.city,
    required this.country,
    required this.imageUrl,
  });

  // Convert a Destination object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'country': country,
      'imageUrl': imageUrl,
    };
  }

  // Create a Destination object from a Firestore document
  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      city: map['city'],
      country: map['country'],
      imageUrl: map['imageUrl'],
    );
  }
}
