import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/bookmark.dart';
import 'package:latihan_kuis_a/screen/home_page.dart'; 
 
class Root extends StatefulWidget { 
  final String nama;  
  
  const Root({super.key, required this.nama}); 
  @override 
  State<Root> createState() => _RootState(); 
} 
 
class _RootState extends State<Root> { 
  int _selectedIndex = 0; 
  @override 
  Widget build(BuildContext context) { 
    final List<Widget> pages = [ 
      HomePage(nama: widget.nama), 
      BookmarkPage(), 
    ]; 
    return Scaffold( 
      body: pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: _selectedIndex, 
        onTap: (index) { 
          setState(() { 
            _selectedIndex = index; 
          }); 
        }, 
        items: [ 
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'), 
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'), 
        ], 
      ), 
    ); 
  } 
} 