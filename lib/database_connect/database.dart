import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollectionProperties =
    _firestore.collection('Properties');
final CollectionReference _mainCollectionAgents =
    _firestore.collection('Agents');
final CollectionReference _mainCollectionResorts =
    _firestore.collection('Resorts');
final CollectionReference _mainCollectionResortsDaypass =
    _firestore.collection('ResortsDaypass');
final CollectionReference _mainCollectionComercialLocals =
    _firestore.collection('ComercialLocals');
final CollectionReference _mainCollectionBuildersProjects =
    _firestore.collection('BuildersProjects');
final CollectionReference _mainCollectionBuildersProjectsComercials =
    _firestore.collection('BuildersProjectsComercials');
final CollectionReference _mainCollectionContractors =
    _firestore.collection('Contractors');
final CollectionReference _mainCollectionAppointments =
    _firestore.collection('Appointments');
final CollectionReference _mainCollectionPayments =
    _firestore.collection('Payments');
final CollectionReference _mainCollectionstorage =
    _firestore.collection('storage');

class Database {
  static String? userUid;

  static Future<void> addProperty({
    required String address,
    required String city,
    required String state,
    required String country,
    required String type,
    required double price,
    required double size,
    required int bedrooms,
    required int bathrooms,
    required String description,
    required String status,
    required String ownerId,
    required String agentId,
    required List<String> images,
  }) async {
    DocumentReference documentReferencer =
        _mainCollectionProperties.doc(userUid).collection('Property').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "address": address,
      "city": city,
      "state": state,
      "country": country,
      "type": type,
      "price": price,
      "size": size,
      "bedrooms": bedrooms,
      "bathrooms": bathrooms,
      "description": description,
      "status": status,
      "owner_id": ownerId,
      "agent_id": agentId,
      "images": images,
      "created_at": FieldValue.serverTimestamp(),
      "updated_at": FieldValue.serverTimestamp(),
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateProperty({
    required String address,
    required String city,
    required String state,
    required String country,
    required String type,
    required double price,
    required double size,
    required int bedrooms,
    required int bathrooms,
    required String description,
    required String status,
    required String ownerId,
    required String agentId,
    required List<String> images,
    required String docId,
  }) async {
    DocumentReference documentReferencer = _mainCollectionProperties
        .doc(userUid)
        .collection('Property')
        .doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "address": address,
      "city": city,
      "state": state,
      "country": country,
      "type": type,
      "price": price,
      "size": size,
      "bedrooms": bedrooms,
      "bathrooms": bathrooms,
      "description": description,
      "status": status,
      "owner_id": ownerId,
      "agent_id": agentId,
      "images": images,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readc() {
    CollectionReference notesItemCollection =
        _mainCollectionProperties.doc(userUid).collection('Property');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteProperty({
    required String docId,
  }) async {
    DocumentReference documentReferencer = _mainCollectionProperties
        .doc(userUid)
        .collection('Property')
        .doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Property deleted from the database'))
        .catchError((e) => print(e));
  }

// Método para agregar un agente
  static Future<void> addAgent({
    required String name,
    required String email,
    required String phone,
    required String profileImage,
    required List<String> properties,
  }) async {
    DocumentReference documentReferencer =
        _mainCollectionAgents.doc(userUid).collection('Agent').doc();

    // Datos del agente
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "phone": phone,
      "profile_image": profileImage,
      "properties":
          properties, // Lista de IDs de propiedades que maneja el agente
      "created_at": FieldValue.serverTimestamp(),
    };

    // Guardar el documento del agente en Firebase
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Agent added to the database"))
        .catchError((e) => print(e));
  }

  // Método para actualizar un agente
  static Future<void> updateAgent({
    required String agentId,
    required String name,
    required String email,
    required String phone,
    required String profileImage,
    required List<String> properties,
  }) async {
    DocumentReference documentReferencer =
        _mainCollectionAgents.doc(userUid).collection('Agent').doc(agentId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "phone": phone,
      "profile_image": profileImage,
      "properties":
          properties, // Lista de IDs de propiedades que maneja el agente
      "updated_at": FieldValue.serverTimestamp(),
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Agent updated in the database"))
        .catchError((e) => print(e));
  }

  // Método para eliminar un agente
  static Future<void> deleteAgent({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollectionAgents.doc(userUid).collection('Agents').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Agents tem deleted from the database'))
        .catchError((e) => print(e));
  }

  // Método para obtener todos los agentes
  static Stream<QuerySnapshot> getAgents() {
    CollectionReference agentCollection =
        _mainCollectionAgents.doc(userUid).collection('Agents');

    return agentCollection.snapshots();
  }

  // Método para obtener un agente por su ID
  static Future<DocumentSnapshot> getAgentById(String agentId) async {
    DocumentReference documentReferencer =
        _mainCollectionAgents.doc(userUid).collection('Agent').doc(agentId);

    return await documentReferencer.get();
  }

  // Método para crear un resort
  static Future<void> addResort({
    required String address,
    required String city,
    required String state,
    required String country,
    required String resortId,
    required String name,
    required String location,
    required double rating,
    required List<String> amenities,
    required double pricePerNight,
    required int availableRooms,
    required String description,
    required List<String> images,
    required String contact,
    required String website,
    required DateTime createdAt,
  }) async {
    DocumentReference documentReferencer =
        _mainCollectionProperties.doc(userUid).collection('Resorts').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "address": address,
      "city": city,
      "state": state,
      "country": country,
      "resortId": resortId,
      "name": name,
      "location": location,
      "rating": rating,
      "amenities": amenities,
      "pricePerNight": pricePerNight,
      "availableRooms": availableRooms,
      "description": description,
      "images": images,
      "contact": contact,
      "website": website,
      "created_at": FieldValue.serverTimestamp(),
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Resort added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateResort({
    required String address,
    required String city,
    required String state,
    required String country,
    required String type,
    required double price,
    required double size,
    required int bedrooms,
    required int bathrooms,
    required String description,
    required String status,
    required String ownerId,
    required String agentId,
    required List<String> images,
    required String docId,
  }) async {
    DocumentReference documentReferencer = _mainCollectionProperties
        .doc(userUid)
        .collection('Property')
        .doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "address": address,
      "city": city,
      "state": state,
      "country": country,
      "type": type,
      "price": price,
      "size": size,
      "bedrooms": bedrooms,
      "bathrooms": bathrooms,
      "description": description,
      "status": status,
      "owner_id": ownerId,
      "agent_id": agentId,
      "images": images,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Resort updated in the database"))
        .catchError((e) => print(e));
  }
}
