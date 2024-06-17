import 'package:flutter/material.dart';

class PatientDescriptionPage extends StatefulWidget {
  final String patientName;
  final int age;

  const PatientDescriptionPage({
    Key? key,
    required this.patientName,
    required this.age,
  }) : super(key: key);

  @override
  _PatientDescriptionPageState createState() => _PatientDescriptionPageState();
}

class _PatientDescriptionPageState extends State<PatientDescriptionPage> {
  bool showHistoryDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 40, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF7E91D4)),
                        color: const Color.fromARGB(255, 98, 134, 163),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/doctors.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.black),
                            const SizedBox(width: 8),
                            Text(
                              widget.patientName,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF13235a),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                size: 8, color: Colors.black),
                            const SizedBox(width: 20),
                            Text(
                              'Age: ${widget.age}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Issue description',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF13235a),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                color: Colors.blue[900],
                child: ListTile(
                  leading: const Icon(Icons.history, color: Colors.white),
                  title: const Text(
                    'Patient History',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    showHistoryDetails
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      showHistoryDetails = !showHistoryDetails;
                    });
                  },
                ),
              ),
              if (showHistoryDetails)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Blood Report'),
                        trailing: const Icon(Icons.remove_red_eye),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('CT Scan Report'),
                        trailing: const Icon(Icons.remove_red_eye),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              Card(
                color: Colors.blue[900],
                child: ListTile(
                  leading: const Icon(Icons.description, color: Colors.white),
                  title: const Text(
                    'Prescription',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
