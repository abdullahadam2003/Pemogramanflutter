import 'dart:convert';

import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.216.204:9001/api/v1/mahasiswa';

  Future<Mahasiswa> getMahasiswaById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        return Mahasiswa.fromJson(data);
      } else {
        print(
            'Failed to load mahasiswa by ID. Status code: ${response.statusCode}');
        throw Exception('Failed to load mahasiswa by ID');
      }
    } catch (e) {
      print('Error getting mahasiswa by ID: $e');
      throw Exception('Failed to load mahasiswa by ID');
    }
  }

  Future<List<Mahasiswa>> getMahasiswa() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Iterable<dynamic> data = json.decode(response.body);
        return data.map((json) => Mahasiswa.fromJson(json)).toList();
      } else {
        print('Failed to load mahasiswa. Status code: ${response.statusCode}');
        throw Exception('Failed to load mahasiswa');
      }
    } catch (e) {
      print('Error getting mahasiswa list: $e');
      throw Exception('Failed to load mahasiswa');
    }
  }

  Future<Mahasiswa> createMahasiswa(Mahasiswa mahasiswa) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(mahasiswa.toJson()),
      );

      if (response.statusCode == 200) {
        return Mahasiswa(
          id: 0,
          nama: mahasiswa.nama,
          email: mahasiswa.email,
          tgllahir: mahasiswa.tgllahir,
        );
      } else {
        print(
            'Failed to create mahasiswa. Status code: ${response.statusCode}');
        throw Exception('Failed to create mahasiswa');
      }
    } catch (e) {
      print('Error creating mahasiswa: $e');
      throw Exception('Failed to create mahasiswa');
    }
  }

  Future<Mahasiswa> updateMahasiswa(Mahasiswa mahasiswa) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${mahasiswa.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(mahasiswa.toJson()),
      );

      if (response.statusCode == 200) {
        return Mahasiswa.fromJson(json.decode(response.body));
      } else {
        print(
            'Failed to update mahasiswa. Status code: ${response.statusCode}');
        throw Exception('Failed to update mahasiswa');
      }
    } catch (e) {
      print('Error updating mahasiswa: $e');
      throw Exception('Failed to update mahasiswa');
    }
  }

  Future<void> deleteMahasiswa(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        print('Mahasiswa berhasil dihapus');
      } else {
        print('Gagal menghapus mahasiswa. Status code: ${response.statusCode}');
        throw Exception('Failed to delete mahasiswa');
      }
    } catch (e) {
      print('Error deleting mahasiswa: $e');
      throw Exception('Failed to delete mahasiswa');
    }
  }
}
