// lib/services/firestore_service.dart
// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/flights.dart';
import '../models/destination.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a flight to Firestore
  Future<void> addFlight(Flight flight) async {
    try {
      await _db.collection('flights').add(flight.toMap());
    } catch (e) {
      print('Error adding flight: $e');
    }
  }

  // Get flights from Firestore
  Stream<List<Flight>> getFlights() {
    return _db.collection('flights').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Flight.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Add a destination to Firestore
  Future<void> addDestination(Destination destination) async {
    try {
      await _db.collection('destinations').add(destination.toMap());
    } catch (e) {
      print('Error adding destination: $e');
    }
  }

  // Get destinations from Firestore
  Stream<List<Destination>> getDestinations() {
    return _db.collection('destinations').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Destination.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
