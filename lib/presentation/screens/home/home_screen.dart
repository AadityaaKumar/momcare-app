import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_theme.dart';
import '../planner/planner_screen.dart';
import '../shopping/shopping_screen.dart';
import '../memories/memories_screen.dart';
import '../expenses/expenses_screen.dart';
import '../teacher_toolkit/teacher_toolkit_screen.dart';
import '../personal/personal_section_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  final List<NavigationTab> _tabs = [
    NavigationTab(label: 'Home', icon: Icons.home),
    NavigationTab(label: 'Planner', icon: Icons.calendar_today),
    NavigationTab(label: 'Shopping', icon: Icons.shopping_bag),
    NavigationTab(label: 'Memories', icon: Icons.photo_album),
    NavigationTab(label: 'Expenses', icon: Icons.attach_money),
    NavigationTab(label: 'Teaching', icon: Icons.school),
    NavigationTab(label: '❤️ From Aadityaa', icon: Icons.favorite),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MomCare'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  !ref.read(themeModeProvider);
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.shifting,
        items: _tabs.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab.icon),
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const _DashboardView();
      case 1:
        return const PlannerScreen();
      case 2:
        return const ShoppingScreen();
      case 3:
        return const MemoriesScreen();
      case 4:
        return const ExpensesScreen();
      case 5:
        return const TeacherToolkitScreen();
      case 6:
        return const PersonalSectionScreen();
      default:
        return const _DashboardView();
    }
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryLight.withOpacity(0.8),
                      AppColors.secondaryLight.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, Mom! 👋',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You\'re doing an amazing job!',
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

            // Quick Stats
            Text(
              'Today\'s Overview',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _StatCard(
                  title: 'Tasks Today',
                  value: '5',
                  icon: Icons.checklist,
                  color: AppColors.primaryLight,
                ),
                _StatCard(
                  title: 'Classes',
                  value: '3',
                  icon: Icons.school,
                  color: AppColors.secondaryLight,
                ),
                _StatCard(
                  title: 'Shopping Items',
                  value: '12',
                  icon: Icons.shopping_bag,
                  color: AppColors.tertiaryLight,
                ),
                _StatCard(
                  title: 'Expenses Today',
                  value: '₹450',
                  icon: Icons.attach_money,
                  color: AppColors.accentLight,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Quick Access Buttons
            Text(
              'Quick Access',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _QuickActionButton(
                  icon: Icons.add_circle_outline,
                  label: 'Add Task',
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.shopping_cart,
                  label: 'Add Item',
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.note_add,
                  label: 'Quick Note',
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.receipt,
                  label: 'Log Expense',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Motivational Quote
            _MotivationalQuoteCard(
              quote:
                  '"You are stronger than you think, and we appreciate everything you do!"',
              author: 'MomCare',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: color, size: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
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

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryLight, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MotivationalQuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const _MotivationalQuoteCard({
    required this.quote,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.tertiaryLight.withOpacity(0.3),
              AppColors.secondaryLight.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.format_quote, size: 32, color: AppColors.primaryLight),
            const SizedBox(height: 12),
            Text(
              quote,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '— $author',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationTab {
  final String label;
  final IconData icon;

  NavigationTab({required this.label, required this.icon});
}
