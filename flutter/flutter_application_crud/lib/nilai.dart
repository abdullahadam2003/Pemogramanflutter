class Nilai {
  int id;
  int idMahasiswa;
  int idMatakuliah;
  double nilai;

  Nilai(
      {required this.id,
      required this.idMahasiswa,
      required this.idMatakuliah,
      required this.nilai});

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      id: json['id'],
      idMahasiswa: json['idMahasiswa'],
      idMatakuliah: json['idMatakuliah'],
      nilai: json['nilai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idMahasiswa': idMahasiswa,
      'idMatakuliah': idMatakuliah,
      'nilai': nilai,
    };
  }
}
