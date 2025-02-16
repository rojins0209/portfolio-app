// lib/screens/projects_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Add this import at the top


class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Projects'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: sampleProjects.length,
        itemBuilder: (context, index) {
          final project = sampleProjects[index];
          return ProjectCard(project: project);
        },
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String githubUrl;
  final String liveUrl;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    required this.githubUrl,
    required this.liveUrl,
  });
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies.map((tech) {
                    return Chip(
                      label: Text(tech),
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    OutlinedButton.icon(
                      icon: Icon(Icons.code),
                      label: Text('Source Code'),
                      onPressed: () {
                        // Launch GitHub URL
                      },
                    ),
                    SizedBox(width: 8),
                    FilledButton.icon(
                      icon: Icon(Icons.launch),
                      label: Text('Live Demo'),
                      onPressed: () {
                        // Launch live demo URL
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Project> sampleProjects = [
  Project(
    title: 'E-commerce App',
    description: 'A full-featured e-commerce application built with Flutter and Firebase.',
    technologies: ['Flutter', 'Firebase', 'Provider', 'REST API'],
    imageUrl: 'assets/projects/ecommerce.png',
    githubUrl: 'https://github.com/yourusername/ecommerce',
    liveUrl: 'https://ecommerce-demo.com',
  ),
  Project(
    title: 'Weather App',
    description: 'Real-time weather application with beautiful UI and animations.',
    technologies: ['Flutter', 'OpenWeather API', 'BLoC', 'Animations'],
    imageUrl: 'assets/projects/weather.png',
    githubUrl: 'https://github.com/yourusername/weather',
    liveUrl: 'https://weather-demo.com',
  ),
];