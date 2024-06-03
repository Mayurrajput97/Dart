import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF13235A),
              ),
              child: Text(
                'SAPDOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Color(0xFF13235A)),
              title: const Text('Categories'),
              onTap: () {},
            ),
            ListTile(
              leading:
                  const Icon(Icons.calendar_today, color: Color(0xFF13235A)),
              title: const Text('Appointment'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.chat, color: Color(0xFF13235A)),
              title: const Text('Chat'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF13235A)),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF13235A)),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF13235A),
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/tanjiro.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Dr. Amol',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF13235A),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Today's Appointments",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13235A),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAppointmentBox(
                    '19/40', 'Pending Appointments', const Color(0xFF7E91D4)),
                _buildAppointmentBox(
                    '21/40', 'Completed Appointments', const Color(0xFF7E91D4)),
              ],
            ),
            const SizedBox(height: 16),
            _buildCalendarBox(),
            const SizedBox(height: 16),
            _buildPatientTile(
              context,
              'John Doe',
              '35 years',
              '10:00 AM',
              const Color(0xFFF41F11),
            ),
            _buildPatientTile(
              context,
              'Jane Smith',
              '42 years',
              '10:15 AM',
              const Color(0xFF145A13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentBox(String count, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarBox() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE0ED),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFF7E91D4)),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: Color(0xFF13235A),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wednesday, March 7',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF13235A),
                ),
              ),
              Text(
                '2 Appointments',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPatientTile(
      BuildContext context, String name, String age, String time, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/patient');
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.watch_later,
              color: color,
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF13235A),
                    ),
                  ),
                  Text(
                    age,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
