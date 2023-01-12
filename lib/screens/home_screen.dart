import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lbooks_app/providers/books_provider.dart';
import 'package:provider/provider.dart';
import 'package:lbooks_app/widgets/books_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foto = ModalRoute.of(context)!.settings.arguments as String;
    final booksProvider = Provider.of<BooksProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(
                Icons.lock_rounded,
                color: Colors.black,
              ),
            ],
            pinned: true,
            centerTitle: true,
            elevation: 0,
            title: Container(
              margin: const EdgeInsets.only(left: 30),
              width: 210,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Bienvenido Javier!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25),
              ),
            ),
            forceElevated: false,
            backgroundColor: const Color(0xffFAC54C),
            floating: true,
            expandedHeight: 180,
            flexibleSpace: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                Image.asset(
                  'assets/imgs/overlay.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 30,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: FileImage(
                        File(foto),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                BookSlider(
                  books: booksProvider.thrillerBooks,
                  title: 'Libros Populares de Terror',
                ),
                BookSlider(
                  books: booksProvider.fantasyBooks,
                  title: 'Libros Populares de Fantasía',
                ),
                BookSlider(
                  books: booksProvider.horrorBooks,
                  title: 'Libros Populares de Horror',
                ),
                BookSlider(
                  books: booksProvider.healthBooks,
                  title: 'Libros Populares de Salud',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// SingleChildScrollView(
//         child: Column(
//           children: [
//             BookSlider(
//                 books: booksProvider.thrillerBooks,
//                 title: 'Libros Populares de Terror'),
//             BookSlider(
//                 books: booksProvider.fantasyBooks,
//                 title: 'Libros Populares de Fantasía'),
//             BookSlider(
//                 books: booksProvider.horrorBooks,
//                 title: 'Libros Populares de Horror'),
//             BookSlider(
//                 books: booksProvider.healthBooks,
//                 title: 'Libros Populares de Salud')
//           ],
//         ),
//       ),