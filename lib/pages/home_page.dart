import 'package:flutter/material.dart';
import 'image_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nama Artis")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImagePage(imagePath: 'assets/artist.jpg'),
                  ),
                );
              },
              child: Image.asset('assets/artist.jpg', width: double.infinity),
            ),
            const SizedBox(height: 10),
            const Text("FYI", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                    (index) => Card(
                  child: Column(
                    children: [
                      Image.asset('assets/concert.jpg', width: 100, height: 80),
                      const Text("Deskripsi berita"),
                      const Text("01-12-2025"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Galeri", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImagePage(imagePath: 'assets/concert.jpg'),
                      ),
                    );
                  },
                  child: Image.asset('assets/concert.jpg', fit: BoxFit.cover),
                );
              },
            ),
            const SizedBox(height: 10),
            const Text("Disc", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Column(
              children: List.generate(
                3,
                    (index) => ListTile(
                  leading: Image.asset('assets/album1.jpg', width: 50),
                  title: const Text("Judul Album"),
                  subtitle: const Text("Deskripsi album"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Bio", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(
              leading: Image.asset('assets/artist.jpg', width: 50),
              title: const Text("Nama Kamu"),
              subtitle: const Text("Motto Hidup"),
            ),
          ],
        ),
      ),
    );
  }
}
