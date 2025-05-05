import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycloudindo_test_app/constants/constants.dart';
import 'package:mycloudindo_test_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/login_img.png',
                width: 195,
                height: 210,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hai, Mulai Eksplorasi Kamu 🚀',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Masuk ke aplikasi untuk mulai eksplorasi bersama kami sekarang',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,

                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                fillColor: ColorsApp.colorBg,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Kata Sandi',
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                fillColor: ColorsApp.colorBg,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [ColorsApp.primaryColor, ColorsApp.primaryColorSec],
                  ),
                ),
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum punya akun?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Daftar Sekarang',
                    style: TextStyle(color: ColorsApp.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
