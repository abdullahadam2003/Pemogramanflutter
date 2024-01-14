import 'package:flutter/material.dart';
import 'package:flutter_application_crud/nilai.dart';
import 'package:flutter_application_crud/api.dart';

class NilaiPage extends StatefulWidget {
  const NilaiPage({super.key});

  @override
  State<NilaiPage> createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  @override
  Widget build(BuildContext context) {
    final ApiService _apiService = ApiService();
    TextEditingController _idMahasiswaController = TextEditingController();
    TextEditingController _idMatakuliahController = TextEditingController();
    TextEditingController _nilaiController = TextEditingController();

    int idData = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nilai"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Id data : $idData"),
                  TextFormField(
                    controller: _idMahasiswaController,
                    decoration: InputDecoration(labelText: 'idMahasiswa'),
                  ),
                  TextFormField(
                    controller: _idMatakuliahController,
                    decoration: InputDecoration(labelText: 'idMatakuliah'),
                  ),
                  TextFormField(
                    controller: _nilaiController,
                    decoration: InputDecoration(labelText: 'nilai'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          print("idMahasiswa: ${_idMahasiswaController.text}");
                          print(
                              "idMatakuliah: ${_idMatakuliahController.text}");

                          Nilai newPost = Nilai(
                            id: 0,
                            idMahasiswa: int.parse(_idMahasiswaController.text),
                            idMatakuliah:
                                int.parse(_idMatakuliahController.text),
                            nilai: double.parse(_nilaiController.text),
                          );

                          print("New Post: $newPost");

                          Nilai createdPost =
                              await _apiService.createNilai(newPost);

                          _idMatakuliahController.clear();
                          _idMahasiswaController.clear();
                          _nilaiController.clear();

                          setState(() {});
                        },
                        child: Text('Create Post'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _apiService.getNilai();
                        },
                        child: Text('Refresh'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _idMatakuliahController.clear();
                          _idMahasiswaController.clear();
                          _nilaiController.clear();
                          setState(() {
                            idData = 0;
                          });
                        },
                        child: Text('Clear Post'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Nilai editPost = Nilai(
                            id: idData,
                            idMatakuliah:
                                int.parse(_idMatakuliahController.text),
                            idMahasiswa: int.parse(_idMahasiswaController.text),
                            nilai: double.parse(_nilaiController.text),
                          );

                          print(_idMatakuliahController.text);

                          print("Post updated successfully");

                          setState(() {
                            idData = 0;
                          });

                          _idMatakuliahController.clear();
                          _idMahasiswaController.clear();
                          _nilaiController.clear();

                          Nilai editedPost =
                              await _apiService.updateNilai(editPost);

                          await _apiService.getNilai();
                        },
                        child: Text('Edit Post'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10),
              child: FutureBuilder<List<Nilai>>(
                future: _apiService.getNilai(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Nilai> posts = snapshot.data!;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${posts[index].idMatakuliah}"),
                          subtitle: Text("${posts[index].idMahasiswa}"),
                          trailing: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red),
                            ),
                            onPressed: () async {
                              _apiService.deleteNilai(posts[index].id);
                              _apiService.getNilai();
                              setState(() {});
                            },
                            child: Text('Delete'),
                          ),
                          onTap: () async {
                            Nilai selectedNilai =
                                await _apiService.getNilaiById(posts[index].id);

                            idData = selectedNilai.id;
                            _idMatakuliahController.text =
                                selectedNilai.idMatakuliah.toString();
                            _idMahasiswaController.text =
                                selectedNilai.idMahasiswa.toString();
                            _nilaiController.text =
                                selectedNilai.nilai.toString();

                            _apiService.getNilai();

                            setState(() {
                              idData = selectedNilai.id;
                              print(selectedNilai.idMatakuliah);
                            });
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
