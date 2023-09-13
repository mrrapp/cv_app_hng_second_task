import 'package:flutter/material.dart';

class Editscreen extends StatefulWidget {
  const Editscreen({super.key});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController slackNameController = TextEditingController();
  final TextEditingController gitHubLinkController = TextEditingController();
  final TextEditingController bioSummaryController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    slackNameController.dispose();
    gitHubLinkController.dispose();
    bioSummaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> initialData =
        ModalRoute.of(context)?.settings.arguments as List<String>;
    fullNameController.text = initialData[0];
    slackNameController.text = initialData[1];
    gitHubLinkController.text = initialData[2];
    bioSummaryController.text = initialData[3];
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Edit CV'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final newFullName = fullNameController.text;
              final newSlackName = slackNameController.text;
              final newGitHubLink = gitHubLinkController.text;
              final newBioSummary = bioSummaryController.text;
              Navigator.pop(
                context,
                [
                  newFullName,
                  newSlackName,
                  newGitHubLink,
                  newBioSummary,
                ],
              );
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // textfields
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'New Full Name'),
            ),
            TextField(
              controller: slackNameController,
              decoration: const InputDecoration(labelText: 'New Slack Name'),
            ),
            TextField(
              controller: gitHubLinkController,
              decoration: const InputDecoration(labelText: 'New GitHub Link'),
            ),
            TextField(
              controller: bioSummaryController,
              decoration: const InputDecoration(labelText: 'New Bio here'),
            ),
          ],
        ),
      ),
    );
  }
}
