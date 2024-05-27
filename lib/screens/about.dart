import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir/screens/home.dart';
import 'package:projek_akhir/screens/list_menu.dart';
import 'package:projek_akhir/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange[600],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama: Bagas Setiaji',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Jurusan: Teknik Informatika',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Kampus: UPN Veteran Yogyakarta',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Asal Kota: Sleman',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'Tentang Mata Kuliah',
              style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ExpansionTile(
              title: Text('1. Kesan', style: GoogleFonts.poppins()),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '- Mata kuliah Teknologi Pemrograman Mobile sangat menarik dan bermanfaat, memberikan pemahaman yang mendalam tentang pengembangan aplikasi mobile.',
                    style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('2. Saran', style: GoogleFonts.poppins()),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '- Perbanyak proyek praktis dan studi kasus agar mahasiswa lebih terlatih dalam menghadapi tantangan nyata di industri',
                    style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _logout(context),
              child: Center(
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.all(22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 12,
            ),
            label: 'About',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.brown[600],
        unselectedItemColor: Colors.brown[600],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          }
        },
      ),
    );
  }
}
