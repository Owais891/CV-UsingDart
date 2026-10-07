import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CvPage(),
  ));
}

class CvPage extends StatefulWidget {
  const CvPage({super.key});

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  // Personal CV Information (Editable)
  String name = 'Owais';
  String title = 'Web & Mobile App Developer';
  String email = 'owais234@gmail.com';
  String phone = '03337634569';
  String location = 'Islamabad, Pakistan';
  String aboutMe =
      'Passionate Mobile & Web Application Developer with expertise in Flutter, Dart, HTML, CSS, JavaScript, and Python. Skilled in building responsive, user-centric applications.';
  String profileImageUrl = 'Resources/Images/owais.jpg';

  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: name);
    final titleController = TextEditingController(text: title);
    final emailController = TextEditingController(text: email);
    final phoneController = TextEditingController(text: phone);
    final locationController = TextEditingController(text: location);
    final imageController = TextEditingController(text: profileImageUrl);
    final aboutController = TextEditingController(text: aboutMe);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit CV Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: titleController,
                decoration:
                    const InputDecoration(labelText: 'Professional Title'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                  labelText: 'Profile Picture Asset or URL',
                  hintText: 'e.g., Resources/Images/owais.jpg',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: aboutController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'About Me'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = nameController.text.trim();
                title = titleController.text.trim();
                email = emailController.text.trim();
                phone = phoneController.text.trim();
                location = locationController.text.trim();
                if (imageController.text.trim().isNotEmpty) {
                  profileImageUrl = imageController.text.trim();
                }
                aboutMe = aboutController.text.trim();
              });
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    if (profileImageUrl.startsWith('http://') ||
        profileImageUrl.startsWith('https://')) {
      return Image.network(
        profileImageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.indigo.shade100,
          child: const Icon(Icons.person, size: 55, color: Colors.indigo),
        ),
      );
    } else {
      return Image.asset(
        profileImageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.indigo.shade100,
          child: const Icon(Icons.person, size: 55, color: Colors.indigo),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Curriculum Vitae'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit CV',
            onPressed: _showEditProfileDialog,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sharing CV...')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Profile Card with Image
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _showEditProfileDialog,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.indigo, width: 3.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: _buildProfileImage(),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        _ContactItem(
                          icon: Icons.email,
                          label: email,
                        ),
                        _ContactItem(
                          icon: Icons.phone,
                          label: phone,
                        ),
                        _ContactItem(
                          icon: Icons.location_on,
                          label: location,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // About Me Section
            _SectionCard(
              title: 'About Me',
              icon: Icons.info,
              child: Text(
                aboutMe,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 16),

            // Technical Skills Section
            const _SectionCard(
              title: 'Technical Skills',
              icon: Icons.code,
              child: Column(
                children: [
                  _SkillBar(skill: 'Flutter & Dart', level: 0.9),
                  SizedBox(height: 8),
                  _SkillBar(skill: 'HTML & CSS', level: 0.85),
                  SizedBox(height: 8),
                  _SkillBar(skill: 'JavaScript & Python', level: 0.8),
                  SizedBox(height: 8),
                  _SkillBar(skill: 'Git & Version Control', level: 0.9),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Work Experience Section
            const _SectionCard(
              title: 'Work Experience',
              icon: Icons.work,
              child: Column(
                children: [
                  _ExperienceItem(
                    role: 'Internship - Web Development',
                    company: 'Arch Technologies Software House',
                    duration: '2026',
                    description:
                        'Worked on web development projects using modern web technologies and frameworks.',
                  ),
                  Divider(height: 24),
                  _ExperienceItem(
                    role: 'Freelance Projects',
                    company: 'Self Employed',
                    duration: 'Ongoing',
                    description:
                        'Developed Car Showroom Management System and custom software applications.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Education Section
            const _SectionCard(
              title: 'Education',
              icon: Icons.school,
              child: _ExperienceItem(
                role: 'BS Software Engineering',
                company: 'Riphah International University',
                duration: '2024',
                description:
                    'Specialized in Software Engineering, Mobile & Web Application Development.',
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _showEditProfileDialog,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Details'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Contact Me'),
                        content: Text(
                          'Thank you for viewing my CV!\nEmail: $email\nPhone: $phone',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Get In Touch'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.indigo),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String skill;
  final double level;

  const _SkillBar({required this.skill, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(skill, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text('${(level * 100).toInt()}%'),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: level,
          backgroundColor: Colors.grey[200],
          color: Colors.indigo,
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final String description;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                role,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                duration,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          company,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(fontSize: 13, height: 1.4),
        ),
      ],
    );
  }
}
