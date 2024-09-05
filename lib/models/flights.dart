
class Flight {
  final String departureDate;
  final String departureTime;
  final String from;
  final String to;
  final String fromCity;
  final String toCity;
  final List<String> searchKeywords;

  Flight({
    required this.departureDate,
    required this.departureTime,
    required this.from,
    required this.to,
    required this.fromCity,
    required this.toCity,
    required this.searchKeywords,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'departureDate': departureDate,
      'departureTime': departureTime,
      'from': from,
      'to': to,
      'fromCity': fromCity,
      'toCity': toCity,
      'searchKeywords': searchKeywords,
    };
  }

  // Create a Flight object from a Firestore document
  factory Flight.fromMap(Map<String, dynamic> map) {
    return Flight(
      departureDate: map['departureDate'],
      departureTime: map['departureTime'],
      from: map['from'],
      to: map['to'],
      fromCity: map['fromCity'],
      toCity: map['toCity'],
      searchKeywords: List<String>.from(map['searchKeywords']),
    );
  }
}
