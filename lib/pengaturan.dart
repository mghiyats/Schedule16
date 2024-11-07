// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'user_profil.dart'; // Pastikan path ini sesuai
import 'jadwal.dart';
import 'dart:io';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  File? _image; // Menyimpan gambar profil
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false; // Status loading
  final _formKey = GlobalKey<FormState>(); // Untuk validasi form

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(
            pickedFile.path); // Memperbarui state dengan gambar yang dipilih
      });

      // Simpan gambar ke dalam provider
      Provider.of<UserProfile>(context, listen: false).setImage(_image);
    }
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Menonaktifkan tombol selama loading
      });

      // Simulasi penyimpanan data
      await Future.delayed(const Duration(seconds: 2));

      // Mengupdate username di provider
      Provider.of<UserProfile>(context, listen: false)
          .setUsername(_usernameController.text);

      // Tampilkan Snackbar setelah menyimpan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Perubahan berhasil disimpan!')),
      );

      setState(() {
        _isLoading = false; // Mengaktifkan kembali tombol
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'HI GHIYATS ! ADA YANG MAU DIUBAH ?',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Bangers',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50.0),
        child: Consumer<UserProfile>(
          builder: (context, userProfile, child) {
            // Set initial value dari username jika ada
            if (_usernameController.text.isEmpty) {
              _usernameController.text = userProfile.username;
            }

            return Form(
              key: _formKey, // Menambahkan form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bagian profil pengguna
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Ganti PP',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Label Username
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Field untuk Username dengan controller
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null; // Validasi sukses
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Masukkan Username',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 182, 182, 182),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Tombol Simpan Perubahan
                  Center(
                    child: GestureDetector(
                      onTap: _isLoading
                          ? null
                          : _saveChanges, // Disable jika loading
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 50),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 122, 8, 0),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                'Simpan Perubahan',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white, size: 35),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 0) {
            // Kembali ke halaman Jadwal
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Jadwal()),
            );
          }
        },
      ),
    );
  }
}
