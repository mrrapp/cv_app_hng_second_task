import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = 'Rapp Jeremiah Nyam';
  String slackName = 'Rapp Jeremaih';
  String gitHubLink = "https://github.com/mrrapp";
  String bioSummary =
      """A highly motivated and versatile biochemist with desire to grow in the Tech community to the point of helping others find their passion in the Tech space. 

Proactive and always looking for opportunities to increase professional and personal development. 

Has the ability to work effectively both independently and in a team""";

//function to update info
  void updateData(String newFullName, String newSlackName, String newGitHubLink,
      String newBioSummary) {
    setState(() {
      fullName = newFullName;
      slackName = newSlackName;
      gitHubLink = newGitHubLink;
      bioSummary = newBioSummary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('CV'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              final result =
                  await Navigator.pushNamed(context, "/edit", arguments: [
                fullName,
                slackName,
                gitHubLink,
                bioSummary,
              ]);
              if (result != null &&
                  result is List<String> &&
                  result.length == 4) {
                updateData(result[0], result[1], result[2], result[3]);
              }
            },
            child: const Text(
              'Edit',
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
            // Personal Information.
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //full name
                    RichText(
                      text: TextSpan(
                          text: 'Full Name:  ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: fullName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    //slack name
                    RichText(
                      text: TextSpan(
                          text: 'Slack Name:  ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: slackName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    //Github handle
                    RichText(
                      text: TextSpan(
                          text: 'GitHub:  ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: gitHubLink,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://ca.slack-edge.com/T05FFAA91JP-U05RJUB00MQ-913d6f0a1c13-512'),
                )
              ],
            ),
            //   const Divider(),
            //A brief personnal bio
            const Text(
              'Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(bioSummary)
          ],
        ),
      ),
    );
  }
}
