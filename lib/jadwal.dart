// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, library_private_types_in_public_api, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:jadwal/pengaturan.dart';
import 'package:jadwal/senin.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingPage(),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isVisible = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 750),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Jadwal(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeIn;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0, // Mengatur transparansi
          duration: const Duration(milliseconds: 1000), // Durasi transisi
          child: const Text(
            'Hi Ghiyats !', // Teks yang ditampilkan
            style: TextStyle(fontSize: 50.0), // Mengatur ukuran teks
          ),
        ),
      ),
    );
  }
}

class Jadwal extends StatefulWidget {
  final Color? tugas1Color;
  final Color? tugas2Color;

  const Jadwal({super.key, this.tugas1Color, this.tugas2Color});

  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  late Color _tugas1Color;
  late Color _tugas2Color;

  @override
  void initState() {
    super.initState();
    // Ambil warna dari constructor
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

              // Title: Jadwal Kuliah
              const Text(
                'JADWAL KULIAH',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Bayon',
                ),
              ),

              const SizedBox(height: 40),

              // Days Buttons with Scrolling
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0), // Padding untuk tepi layar
                  child: Column(
                    children: [
                      PressableButton(
                        title: 'SENIN',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      Senin(
                                tugas1Color: _tugas1Color, // Meneruskan warna
                                tugas2Color: _tugas2Color, // Meneruskan warna
                              ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin =
                                    Offset(1.0, 0.0); // Transisi ke kanan
                                const end = Offset.zero;
                                const curve = Curves.easeInOutCubic;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 25), // Jarak antara tombol
                      PressableButton(
                        title: 'SELASA',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          // Tambahkan logika untuk hari SELASA
                        },
                      ),
                      const SizedBox(height: 25), // Jarak antara tombol
                      PressableButton(
                        title: 'RABU',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          // Tambahkan logika untuk hari RABU
                        },
                      ),
                      const SizedBox(height: 25), // Jarak antara tombol
                      PressableButton(
                        title: 'KAMIS',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          // Tambahkan logika untuk hari KAMIS
                        },
                      ),
                      const SizedBox(height: 25), // Jarak antara tombol
                      PressableButton(
                        title: 'JUM\'AT',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          // Tambahkan logika untuk hari JUM'AT
                        },
                      ),
                      const SizedBox(height: 25), // Jarak antara tombol
                      PressableButton(
                        title: 'SABTU',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          // Tambahkan logika untuk hari SABTU
                        },
                      ),
                      const SizedBox(height: 25), // Jarak antara tombol
                      PressableButton(
                        title: 'MINGGU',
                        isCenter: true,
                        backgroundColor: const Color.fromARGB(
                            255, 117, 0, 0), // Ubah background menjadi merah
                        textColor: Colors.white,
                        onTap: () {
                          // Tambahkan logika untuk hari MINGGU
                        },
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
                // Navigasi ke halaman Pengaturan
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const Pengaturan();
                  }),
                );
              }
            }));
  }
}

class PressableButton extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;
  final bool isCenter;

  const PressableButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
    this.isCenter = false,
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
        borderRadius: BorderRadius.circular(50),
        onTap: widget.onTap,
        onHighlightChanged: (isHighlighted) {
          setState(() {
            isPressed = isHighlighted;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 20), // Padding vertikal untuk tombol
          width: double.infinity, // Lebar 100%
          decoration: BoxDecoration(
            color: isPressed
                ? widget.backgroundColor
                    .withOpacity(0.8) // Ubah opasitas saat ditekan
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isPressed
                ? [] // Tidak ada shadow saat ditekan
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: Column(
            mainAxisAlignment: widget.isCenter
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Mengatur keselarasan
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 25, // Ubah ukuran font menjadi 20
                  fontFamily: 'Bayon', // Menggunakan font Bayon
                ),
                textAlign: TextAlign.center, // Mengatur teks menjadi center
              ),
            ],
          ),
        ),
      ),
    );
  }
}
