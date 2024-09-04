import 'package:cloud_firestore/cloud_firestore.dart';

class BookTrip {
  String? destination;
  double? price;
  String? userId;
  Timestamp? flightTime;
  BookTrip(String a, double b, String c, Timestamp d) {
    //local variables ---- are local to the class
    destination = a;
    price = b;
    userId = c;
    flightTime = d;
  }

  Map<String, dynamic> toMap() {
    return {
      'destination': destination,
      'price': price,
      'userId': userId,
      'flightTime': flightTime,
    };
  }
}
