// import 'package:flutter/material.dart';

// void main() {
//   runApp(HomeScreen());
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Exercicio Bottom Navigation"),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
// // Adicione esta linha para lidar com a troca de página
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person), label: "Minha conta"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_basket), label: "Meus pedidos"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: "Favoritos"),
//         ],
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }

// class NewPageScreen1 extends StatelessWidget {
//   final String texto;

//   NewPageScreen1(this.texto);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(texto),
//     );
//   }
// }

// class NewPageScreen2 extends StatelessWidget {
//   final String texto;

//   NewPageScreen2(this.texto);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(texto),
//     );
//   }
// }

// class NewPageScreen3 extends StatelessWidget {
//   final String texto;

//   NewPageScreen3(this.texto);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(texto),
//     );
//   }
// }
