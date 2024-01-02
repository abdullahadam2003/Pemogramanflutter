import 'package:flutter/material.dart';
import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      Mahasiswa newPost = Mahasiswa(
                        id: 0,
                        nama: _namaController.text,
                        email: _emailController.text,
                        tgllahir: _tgllahirController.text,
                      );
                      Mahasiswa createdPost =
                          await _apiService.createMahasiswa(newPost);

                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      setState(() {});
                    },
                    child: Text('Create Post'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Mahasiswa>>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Mahasiswa> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].nama),
                        subtitle: Text(posts[index].email),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () async {
                            try {
                              bool confirmDelete = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Konfirmasi"),
                                    content: Text(
                                        "Anda yakin ingin menghapus ${posts[index].nama}?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text("Batal"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop(true);
                                          await _apiService
                                              .deleteMahasiswa(posts[index].id);
                                          setState(() {});
                                        },
                                        child: Text("Hapus"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } catch (e) {
                              print('Error deleting mahasiswa: $e');
                              // Handle or display the error as needed
                            }
                          },
                          child: Text("Delete"),
                        ),
                        onTap: () async {
                          Mahasiswa selectedMahasiswa = await _apiService
                              .getMahasiswaById(posts[index].id);

                          _namaController.text = selectedMahasiswa.nama;
                          _emailController.text = selectedMahasiswa.email;
                          _tgllahirController.text = selectedMahasiswa.tgllahir;

                          setState(() {});
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
