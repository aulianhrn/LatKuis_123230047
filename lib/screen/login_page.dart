import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/users.dart';
import 'package:latihan_kuis_a/root.dart';
import 'package:latihan_kuis_a/screen/Home_Page.dart';
import 'package:latihan_kuis_a/screen/bookmark.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedIn = false;
  bool _isVisible = false;

  //Fungsi Login
  void _login() {
    if (_usernameController.text == user1.username && _passwordController.text == user1.password) {
      setState(() {
        isLoggedIn = true;
      });
      
      Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => Root(nama: user1.nama),
        ),
      );
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isLoggedIn ? "Login Berhasil" : "Login Gagal! Mohon masukkan Username dan Password yang sesuai."),
        
        backgroundColor: isLoggedIn ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
      buatlah tampilan login sederhana dengan menggunakan widget TextField untuk input username dan password, serta ElevatedButton untuk tombol login.
      - TextField untuk username dengan hint text "Username"
      - TextField untuk password dengan hint text "Password" dan obscureText true
      - ElevatedButton dengan text "Login" yang ketika ditekan akan menampilkan snackbar dengan pesan
        "Login berhasil" jika username dan password tidak kosong, atau "Login gagal" jika salah satu atau kedua field kosong.
      - jika login berhasil, navigasikan ke halaman MovieListPage (buat halaman MovieListPage 
    
     */
    
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Text("Log In",
                style: TextStyle(                  
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple
                )
              ),

              Text("Masukkan username dan password untuk login ",
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.grey
                ),
              ),

              SizedBox(height: 20),
              _usernameField(),
              SizedBox(height: 20),
              _passwordField(),
          
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: _login, 

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  )
                ),
                
                child: Text("Log In", 
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 214, 214, 214),
            blurRadius: 5,
          ),
        ],
      ),

      child: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          hintText: 'username',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),

          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Icon(Icons.person),
          ),

          filled: true,
          fillColor: Colors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }


  Widget _passwordField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 214, 214, 214),
            blurRadius: 5,
          ),
        ],
      ),

      child: TextField(
        controller: _passwordController,
        obscureText: !_isVisible,
      
        decoration: InputDecoration(
          hintText: 'password',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),

          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Icon(Icons.lock),
          ),
          
          suffixIcon: Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: IconButton(
              icon: Icon(
                _isVisible? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
            ),
          ),
      
          filled: true,
          fillColor: Colors.white,
      
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
      
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}