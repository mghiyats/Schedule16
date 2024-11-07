// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jadwal/jadwal.dart';
import 'package:jadwal/pengaturan.dart';
import 'package:vibration/vibration.dart';

class Senin extends StatefulWidget {
  const Senin({super.key, this.tugas1Color, this.tugas2Color});

  final Color? tugas1Color;
  final Color? tugas2Color;

  @override
  _SeninState createState() => _SeninState();
}

class _SeninState extends State<Senin> {
  late Color _tugas1Color;
  late Color _tugas2Color;

  @override
  void initState() {
    super.initState();
    _tugas1Color = widget.tugas1Color ?? const Color.fromARGB(255, 255, 145, 0);
    _tugas2Color = widget.tugas2Color ?? const Color.fromARGB(255, 255, 145, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Header Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    // Profile Section
                    Transform.translate(
                      offset: const Offset(-60, 0), // Geser 50 piksel ke kiri
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 50.0), // Ruang di sebelah kiri teks
                              child: Text(
                                'HI GHIYATS !',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Bangers',
                                ),
                              ),
                            ),
                            SizedBox(width: 25), // Jarak antara teks dan gambar
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/pp.png'),
                              radius: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Semester Text
                    const Text(
                      'SEMESTER 5',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bayon',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Title: Senin
              const Text(
                'SENIN',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Bayon',
                ),
              ),

              // Days Buttons with Scrolling
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Mengubah scroll ke horizontal
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      // Container 1
                      Container(
                        width: 400,
                        height: 250, // Atur tinggi sesuai kebutuhan
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 150, 10, 0), // Background merah
                          borderRadius:
                              BorderRadius.circular(20.0), // Border radius
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.all(15.0), // Jarak dalam container
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.start, // Memindahkan ke atas
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  'Kewirausahaan',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      50), // Jarak antara judul dan teks di bawahnya
                              Text(
                                'KU1-02-17',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15), // Jarak antar teks
                              Text(
                                '06.30-08.30',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(), // Mengisi ruang agar teks berikutnya di pojok kanan bawah
                              Align(
                                alignment: Alignment
                                    .bottomRight, // Menempatkan nama dosen di kanan bawah
                                child: Text(
                                  'Muhammad Yusuf',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                          width: 20), // Jarak antara Container 1 dan 2

                      // Container 2
                      Container(
                        width: 400,
                        height: 250, // Atur tinggi sesuai kebutuhan
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 150, 10, 0), // Background merah
                          borderRadius:
                              BorderRadius.circular(20.0), // Border radius
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.all(15.0), // Jarak dalam container
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.start, // Memindahkan ke atas
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  'Penjaminan Mutu',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      50), // Jarak antara judul dan teks di bawahnya
                              Text(
                                'TULT-07-09',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15), // Jarak antar teks
                              Text(
                                '10.30-12.30',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(), // Mengisi ruang agar teks berikutnya di pojok kanan bawah
                              Align(
                                alignment: Alignment
                                    .bottomRight, // Menempatkan nama dosen di kanan bawah
                                child: Text(
                                  'Sri Widowati',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                          width: 20), // Jarak antara Container 2 dan 3

                      // Container 3
                      Container(
                        width: 400,
                        height: 250, // Atur tinggi sesuai kebutuhan
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 150, 10, 0), // Background merah
                          borderRadius:
                              BorderRadius.circular(20.0), // Border radius
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.all(15.0), // Jarak dalam container
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.start, // Memindahkan ke atas
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  'Manajemen Proyek',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      50), // Jarak antara judul dan teks di bawahnya
                              Text(
                                'TULT-07-15',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15), // Jarak antar teks
                              Text(
                                '14.30-16.30',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(), // Mengisi ruang agar teks berikutnya di pojok kanan bawah
                              Align(
                                alignment: Alignment
                                    .bottomRight, // Menempatkan nama dosen di kanan bawah
                                child: Text(
                                  'Arvive Gandhi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 0),

              const Text(
                'Deadline',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Bayon',
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      PressableButton(
                        title: 'TP MOD Web',
                        backgroundColor: _tugas1Color,
                        textColor: Colors.white,
                        onTap: () => _showConfirmationDialog(true),
                      ),
                      const SizedBox(width: 20),
                      PressableButton(
                        title: 'TP MOD Mobile',
                        backgroundColor: _tugas2Color,
                        textColor: Colors.white,
                        onTap: () => _showConfirmationDialog(false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Bottom Navigation Bar
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
                  MaterialPageRoute(builder: (context) {
                    return Jadwal(
                      tugas1Color: _tugas1Color,
                      tugas2Color: _tugas2Color,
                    );
                  }),
                );
              } else if (index == 1) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return Pengaturan();
                  }),
                );
              }
            }));
  }

  void _showConfirmationDialog(bool isTugas) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Apakah kamu sudah mengerjakan?'),
          actions: [
            TextButton(
              onPressed: () async {
                if (await Vibration.hasVibrator() ?? false) {
                  Vibration.vibrate(duration: 100);
                }
                setState(() {
                  if (isTugas) {
                    _tugas1Color = const Color.fromARGB(255, 0, 132, 255);
                  } else {
                    _tugas2Color = const Color.fromARGB(255, 0, 132, 255);
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Sudah'),
            ),
            TextButton(
              onPressed: () async {
                if (await Vibration.hasVibrator() ?? false) {
                  Vibration.vibrate(duration: 100);
                }
                setState(() {
                  if (isTugas) {
                    _tugas1Color = const Color.fromARGB(255, 255, 145, 0);
                  } else {
                    _tugas2Color = const Color.fromARGB(255, 255, 145, 0);
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Belum'),
            ),
          ],
        );
      },
    );
  }
}

// Pressable Button Class
class PressableButton extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const PressableButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  _PressableButtonState createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: widget.onTap,
        onHighlightChanged: (isHighlighted) {
          setState(() {
            isPressed = isHighlighted;
          });
        },
        child: Container(
          width: 400, // Ukuran container tetap sama
          height: 250,
          decoration: BoxDecoration(
            color: isPressed
                ? widget.backgroundColor
                    .withOpacity(0.8) // Ubah opasitas saat ditekan
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: isPressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5), // posisi shadow
                    ),
                  ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0), // Jarak dalam container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 35),
                Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: widget.textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    'Jam',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    '06.00',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
