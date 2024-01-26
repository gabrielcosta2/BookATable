import 'package:cloud_firestore/cloud_firestore.dart';

class ReservasService {
  // Obtém a transmissão (stream) de reservas do Firestore
  Stream<List<reserva>> getReservas() {
    return FirebaseFirestore.instance
        .collection('reservas')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              Map<String, dynamic> data = doc.data();
              return reserva(
                id: doc.id,
                nome: data['nome'],
                quantidade: data['quantidade'],
                horas: data['horas'],
                dia: (data['dia'] as Timestamp).toDate(),
              );
            }).toList());
  }
}

// Modelo de dados para representar uma reserva
class reserva {
  String id;
  String nome;
  int quantidade;
  String horas;
  DateTime dia;

  // Construtor da classe
  reserva({
    required this.id,
    required this.nome,
    required this.quantidade,
    required this.horas,
    required this.dia,
  });

  // Construtor de fábrica para criar uma instância de reserva a partir de um mapa
  factory reserva.fromMap(Map<String, dynamic> data, String documentId) {
    return reserva(
      id: documentId,
      nome: data['nome'],
      quantidade: data['quantidade'],
      horas: data['horas'],
      dia: (data['dia'] as Timestamp).toDate(),
    );
  }
}
