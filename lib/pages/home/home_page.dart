import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/widgets/specialist_item.dart';
import 'package:flutter_medical_ui/widgets/tempat_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("Teman Sehat", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Hello,",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Rian El Brianne",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage("assets/rian.png"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 223, 200, 228),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/surgeon.png",
                              width: 92,
                              height: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "How do you feel?",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const SizedBox(
                                  width: 120,
                                  child: Text(
                                    "Fill out your medical right now",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 150,
                                  height: 35,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green[700],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(95, 219, 214, 214),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Resume Medis",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            SpecialistItem(
                              imagePath: "assets/rawat_jalan.png",
                              imageName: "Rawat Jalan",
                            ),
                            SizedBox(width: 8),
                            SpecialistItem(
                              imagePath: "assets/tes_lab.png",
                              imageName: "Tes Lab",
                            ),
                            SizedBox(width: 8),
                            SpecialistItem(
                              imagePath: "assets/halo_doc.png",
                              imageName: "Halo Doc",
                            ),
                            SizedBox(width: 8),
                            SpecialistItem(
                              imagePath: "assets/bpjs.png",
                              imageName: "BPJS Activasion",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(95, 219, 214, 214),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Rumah Sakit & Apotek",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            TempatItem(
                              image: "assets/RSUD_DepatiHamzah.png",
                              name: "RSUD Depati Hamzah",
                              specialist: "Rumah Sakit",
                            ),
                            TempatItem(
                              image: "assets/Apotek_K24_Selindung.png",
                              name: "Apotek K24 Selindung",
                              specialist: "Apotek",
                            ),
                            TempatItem(
                              image: "assets/rsbt.png",
                              name: "RS Bakti Timah",
                              specialist: "Rumah Sakit",
                            ),
                            TempatItem(
                              image: "assets/RSUP_Babel.png",
                              name: "RSUP Bangka Belitung",
                              specialist: "Rumah Sakit",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
