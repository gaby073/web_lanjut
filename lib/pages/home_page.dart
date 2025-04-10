import 'package:flutter/material.dart';
import 'image_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme; // ← Tambahkan ini

  const HomePage({super.key, required this.onToggleTheme}); // ← Tambahkan ini

  @override
  Widget build(BuildContext context) {
    final imageList = [
      'assets/Hyunsuk.png',
      'assets/Junghan.png',
      'assets/junkyu.png',
      'assets/Yoshi.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Watanabe Haruto"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6), // Icon toggle
            onPressed: onToggleTheme, // ← Panggil fungsi toggle
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainImage(context),
            const SizedBox(height: 16),
            _buildSectionTitle("FYI"),
            const SizedBox(height: 8),
            _buildFYISection(),
            const SizedBox(height: 16),
            _buildSectionTitle("Galeri"),
            const SizedBox(height: 8),
            _buildGallerySection(imageList, context),
            const SizedBox(height: 16),
            _buildSectionTitle("Disc"),
            const SizedBox(height: 8),
            _buildDiscSection(),
            const SizedBox(height: 16),
            _buildSectionTitle("Bio"),
            const SizedBox(height: 8),
            _buildBioSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const ImagePage(imagePath: 'assets/Haruto.png'),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Haruto.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFYISection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(right: 12),
            child: Container(
              width: 140,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/Haruto.png', fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text("Deskripsi berita", style: TextStyle(fontSize: 12)),
                  const Text("01-12-2025", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGallerySection(List<String> imageList, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePage(imagePath: imageList[index]),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imageList[index], fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Widget _buildDiscSection() {
    final albums = [
      {'title': 'I love you', 'description': 'Judul Album 1'},
      {'title': 'Wayo Wayo', 'description': 'Judul Album 2'},
      {'title': 'My Treasure', 'description': 'Judul Album 3'},
    ];

    return Column(
      children: albums.map((album) {
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/Yoshi.png', width: 50),
          ),
          title: Text(album['title']!),
          subtitle: Text(album['description']!),
        );
      }).toList(),
    );
  }


  Widget _buildBioSection() {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/Haruto.png', width: 50),
      ),
      title: const Text("Watanabe Haruto"),
      subtitle: const Text(
        "TERUSLAH BERJUANG SAMPAI APA YANG KAMI MAU TERCAPAI",
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
