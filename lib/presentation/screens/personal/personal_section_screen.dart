import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/theme/app_colors.dart';

class PersonalSectionScreen extends StatefulWidget {
  const PersonalSectionScreen({Key? key}) : super(key: key);

  @override
  State<PersonalSectionScreen> createState() => _PersonalSectionScreenState();
}

class _PersonalSectionScreenState extends State<PersonalSectionScreen> {
  final TextEditingController _letterController = TextEditingController();
  bool _isEditingLetter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('❤️ From Aadityaa'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondaryLight.withOpacity(0.6),
                        AppColors.primaryLight.withOpacity(0.4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Icon(Icons.favorite, size: 48, color: AppColors.highPriority),
                      const SizedBox(height: 12),
                      Text(
                        'A Gift From Your Son',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'With love and appreciation',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'A Personal Message',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _isEditingLetter
                      ? Column(
                          children: [
                            TextField(
                              controller: _letterController,
                              maxLines: 6,
                              decoration: const InputDecoration(
                                hintText: 'Write your personal message here...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => setState(() => _isEditingLetter = false),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () => setState(() => _isEditingLetter = false),
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _letterController.text.isEmpty
                                  ? 'To be filled by Aadityaa...'
                                  : _letterController.text,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (_letterController.text.isEmpty)
                              ElevatedButton.icon(
                                onPressed: () => setState(() => _isEditingLetter = true),
                                icon: const Icon(Icons.edit),
                                label: const Text('Add Message'),
                              ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'A Special Quote',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accentLight.withOpacity(0.3),
                        AppColors.tertiaryLight.withOpacity(0.2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(Icons.format_quote, size: 36, color: AppColors.primaryLight),
                      const SizedBox(height: 12),
                      Text(
                        'Thank you for everything you do for our family and your students.\nHappy Birthday, Mom ❤️',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'With Love,\nAadityaa',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Family Photos',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      const Icon(Icons.photo_gallery, size: 48, color: AppColors.primaryLight),
                      const SizedBox(height: 12),
                      Text(
                        'Favorite family photos will appear here',
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add_photo_alternate),
                        label: const Text('Add Photos'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _letterController.dispose();
    super.dispose();
  }
}