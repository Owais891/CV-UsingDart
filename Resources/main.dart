import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CVPage(),
  ));
}

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Owais - CV"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Profile Picture
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.deepPurple, width: 3.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "Resources/Images/owais.jpg",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.deepPurple.shade100,
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Owais",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Web & Mobile App Developer",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Contact Info
            const Text(
              "📞 Contact Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text("owais234@gmail.com"),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.deepPurple),
              title: Text("03337634569"),
            ),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.deepPurple),
              title: Text("Islamabad, Pakistan"),
            ),
            const SizedBox(height: 16),

            // Education
            const Text(
              "🎓 Education",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.school, color: Colors.deepPurple),
              title: Text("BS Software Engineering"),
              subtitle: Text("Riphah International University, 2024"),
            ),
            const SizedBox(height: 16),

            // Skills
            const Text(
              "💡 Skills",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(
                  avatar: Icon(Icons.flutter_dash, size: 18),
                  label: Text("Flutter"),
                ),
                Chip(
                  avatar: Icon(Icons.code, size: 18),
                  label: Text("Dart"),
                ),
                Chip(
                  avatar: Icon(Icons.html, size: 18),
                  label: Text("HTML & CSS"),
                ),
                Chip(
                  avatar: Icon(Icons.javascript, size: 18),
                  label: Text("JavaScript"),
                ),
                Chip(
                  avatar: Icon(Icons.terminal, size: 18),
                  label: Text("Python"),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Experience
            const Text(
              "💼 Experience",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.work, color: Colors.deepPurple),
              title: Text("Internship - Web Development"),
              subtitle: Text("Arch Technologies Software House, 2026"),
            ),
            const ListTile(
              leading: Icon(Icons.work, color: Colors.deepPurple),
              title: Text("Freelance Projects"),
              subtitle: Text("Car Showroom Management System"),
            ),
          ],
        ),
      ),
    );
  }
}
