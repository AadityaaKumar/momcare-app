import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/theme/app_colors.dart';

class TeacherToolkitScreen extends StatefulWidget {
  const TeacherToolkitScreen({Key? key}) : super(key: key);

  @override
  State<TeacherToolkitScreen> createState() => _TeacherToolkitScreenState();
}

class _TeacherToolkitScreenState extends State<TeacherToolkitScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Toolkit'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Classes'),
            Tab(text: 'Attendance'),
            Tab(text: 'Homework'),
            Tab(text: 'Marks'),
            Tab(text: 'Timetable'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ClassesTab(),
          _AttendanceTab(),
          _HomeworkTab(),
          _MarksTab(),
          _TimetableTab(),
        ],
      ),
    );
  }
}

class _ClassesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classes = ['Class 10-A', 'Class 9-B', 'Class 8-C'];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: classes.length,
      itemBuilder: (context, index) => Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(Icons.class_, color: AppColors.primaryLight),
          title: Text(classes[index]),
          subtitle: Text('${30 + index} students'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {},
        ),
      ),
    );
  }
}

class _AttendanceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mark Attendance', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(
                  5,
                  (index) => CheckboxListTile(
                    title: Text('Student ${index + 1}'),
                    value: index < 4,
                    onChanged: (val) {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeworkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) => Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text('Homework ${index + 1}'),
          subtitle: Text('Due: ${DateTime.now().add(Duration(days: index + 1)).toString().split(' ')[0]}'),
          trailing: const Icon(Icons.edit),
          onTap: () {},
        ),
      ),
    );
  }
}

class _MarksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Exam Results', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Student ${index + 1}'),
                        Text('${85 - index * 5}/100', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimetableTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: days.length,
      itemBuilder: (context, index) => Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(days[index]),
          subtitle: Text('${4 + index % 2} classes'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {},
        ),
      ),
    );
  }
}