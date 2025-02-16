import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          Switch(
            value: true,
            onChanged: (value) {},
            activeColor: Color(0xFFE2FF00),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'CRAFTING DIGITAL GOODS SINCE — Y:2017',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      // Profile image positioned above the name
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 40),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                          color: Color(0xFFE2FF00),
                          width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Container(
                            color: Colors.grey[900],
                            child: Icon(
                              Icons.person_outline,
                              size: 50,
                              color: Color(0xFFE2FF00),
                            ),
                          ),
                        ),
                      ),
                      // Centered name
                      Text(
                        'ROJINS',
                        style: TextStyle(
                          color: Color(0xFFE2FF00),
                          fontSize: isSmallScreen ? 48 : 56,
                          fontWeight: FontWeight.bold,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        'S MARTIN',
                        style: TextStyle(
                          color: Color(0xFFE2FF00),
                          fontSize: isSmallScreen ? 48 : 56,
                          fontWeight: FontWeight.bold,
                          height: 0.9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 600),
                child: Text(
                  'I\'m a passionate Flutter developer and IT engineering student — dedicated to building innovative and user-friendly applications for over 3 years',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 18 : 20,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 60),
              Icon(
                Icons.star,
                color: Color(0xFFE2FF00),
                size: 24,
              ),
              SizedBox(height: 40),
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                child: _buildExperienceSection(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ExperienceItem(
          company: 'NovaSpark',
          position: 'Founder & Software Developer',
          duration: '2024 - Present',
        ),
        SizedBox(height: 24),
        _ExperienceItem(
          company: 'IEEE SB AJCE',
          position: 'Design Co-lead',
          duration: '2023 - Present',
        ),
        SizedBox(height: 24),
        _ExperienceItem(
          company: 'GDG AJCE',
          position: 'Designer',
          duration: '2023 - Present',
        ),
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String company;
  final String position;
  final String duration;

  const _ExperienceItem({
    required this.company,
    required this.position,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[900]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: TextStyle(
              color: Color(0xFFE2FF00),
              fontSize: isSmallScreen ? 20 : 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            position,
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            duration,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: isSmallScreen ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }
}