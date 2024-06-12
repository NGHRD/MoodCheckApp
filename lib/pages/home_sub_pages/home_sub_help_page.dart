import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSubHelpPage extends StatelessWidget {
  const HomeSubHelpPage({super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF5F0ED),
      appBar: AppBar(
        title: const Text('Help & Informatie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0), // You can customize the margin values
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4.0), // Adjust margin values as needed
                    child: const Text(
                      'Voor levensbedreigende situaties',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Text(
                    'Bel 112',
                    style: TextStyle(
                      color: Color(0xFFEE7179),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4.0), // Adjust margin values as needed
                    child: const Text(
                      'Denk je aan zelfmoord?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bel 113'),
                    ],
                  )

                ]
              ),
            ),

            const SizedBox(height: 5),
            const Text('Een luisterend oor?'),
            const SizedBox(height: 5),
            const Text('Meer over mentale zorg'),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Bel 088 0767 000'),
              onTap: () => _makePhoneCall('31880767000'),
            ),
            ListTile(
              title: const Text('Chat via: https://deluisterlijn.nl/'),
              onTap: () => _launchInBrowser(Uri.parse('https://deluisterlijn.nl/')),
            ),
            ListTile(
              title: const Text('Chat via: https://www.113.nl/chatten'),
              onTap: () => _launchInBrowser(Uri.parse('https://www.113.nl/chatten')),
            ),
            ListTile(
              title: const Text('https://moetiknaardedokter.nl/klacht/psychische-klachten'),
              onTap: () => _launchInBrowser(Uri.parse('https://moetiknaardedokter.nl/klacht/psychische-klachten')),
            ),
            ListTile(
              title: const Text('https://www.thuisarts.nl/psychische-klachten-bij-volwassene'),
              onTap: () => _launchInBrowser(Uri.parse('https://www.thuisarts.nl/psychische-klachten-bij-volwassene')),
            ),
            ListTile(
              title: const Text(
                  'https://www.thuisarts.nl/hulp-bij-psychische-klachten-bij-volwassenen/ik-heb-psychische-klachten-hoe-ga-ik-daar-mee-om'),
              onTap: () => _launchInBrowser(Uri.parse(
                  'https://www.thuisarts.nl/hulp-bij-psychische-klachten-bij-volwassenen/ik-heb-psychische-klachten-hoe-ga-ik-daar-mee-om'
              )),
            ),
          ],
        ),
      ),
    );
  }
}
