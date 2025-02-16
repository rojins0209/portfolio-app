import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'SKILLS & EXPERTISE',
                style: GoogleFonts.spaceMono(
                  textStyle: TextStyle(
                    color: Color(0xFFE2FF00),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _SectionTitle(title: 'TECHNICAL SKILLS'),
                SizedBox(height: 24),
                ...technicalSkills.map((skill) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SkillCard(
                    skill: skill.name,
                    level: skill.level,
                  ),
                )),
                SizedBox(height: 40),
                _SectionTitle(title: 'TOOLS & TECHNOLOGIES'),
                SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: tools.length,
                  itemBuilder: (context, index) {
                    return ToolCard(name: tools[index]);
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.spaceMono(
        textStyle: TextStyle(
          color: Color(0xFFE2FF00),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String skill;
  final double level;

  const SkillCard({
    required this.skill,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey[800]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: GoogleFonts.spaceMono(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                height: 4,
                width: MediaQuery.of(context).size.width * level * 0.7,
                decoration: BoxDecoration(
                  color: Color(0xFFE2FF00),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '${(level * 100).round()}%',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final String name;

  const ToolCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey[800]!,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.spaceMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final List<Skill> technicalSkills = [
  Skill(name: 'Flutter Development', level: 0.9),
  Skill(name: 'UI/UX Design', level: 0.85),
  Skill(name: 'Responsive Design', level: 0.8),
  Skill(name: 'Flutter Architecture', level: 0.75),
  Skill(name: 'State Management', level: 0.85),
  Skill(name: 'Clean Code', level: 0.8),
];

final List<String> tools = [
  'Android Studio',
  'VS Code',
  'Git',
  'GitHub',
  'Figma',
  'Adobe XD',
  'Firebase',
  'REST APIs',
];

class Skill {
  final String name;
  final double level;

  const Skill({
    required this.name,
    required this.level,
  });
}