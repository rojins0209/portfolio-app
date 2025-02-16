// lib/screens/contact_screen.dart
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Me'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactInfoCard(),
            SizedBox(height: 24),
            Text(
              'Send me a message',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            ContactForm(
              formKey: _formKey,
              nameController: _nameController,
              emailController: _emailController,
              messageController: _messageController,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            ContactInfoItem(
              icon: Icons.email,
              title: 'Email',
              content: 'your.email@example.com',
            ),
            SizedBox(height: 12),
            ContactInfoItem(
              icon: Icons.phone,
              title: 'Phone',
              content: '+1 234 567 890',
            ),
            SizedBox(height: 12),
            ContactInfoItem(
              icon: Icons.location_on,
              title: 'Location',
              content: 'City, Country',
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: [
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {
                    // Launch LinkedIn
                  },
                ),
                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: () {
                    // Launch GitHub
                  },
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    // Launch Facebook
                  },
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Launch Instagram
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const ContactForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              if (!value!.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.message),
            ),
            maxLines: 5,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: Icon(Icons.send),
              label: Text('Send Message'),
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // Handle form submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Message sent successfully!')),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}