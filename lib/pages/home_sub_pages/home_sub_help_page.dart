import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSubHelpPage extends StatelessWidget {
  HomeSubHelpPage({Key? key}) : super(key: key);

  final TextStyle linkTextStyle1 = GoogleFonts.inika(
    fontSize: 18,
    color: const Color(0xFF7D7B79),
  );

  final TextStyle linkTextStyle2 = GoogleFonts.inika(
    fontSize: 18,
    color: const Color(0xFF4CC246),
  );

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
        backgroundColor: const Color(0xFFD6CDC8),
        title: Center(
          child: Text(
            "Moodcheck",
            style: GoogleFonts.inika(
                fontSize: 20
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Voor levensbedreigende situaties',
                      style: GoogleFonts.inika(
                          fontSize: 18
                      ),
                    ),
                  ),
                  Text(
                    'Bel 112',
                    style: GoogleFonts.inika(
                        color: const Color(0xFFEE7179),
                        fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 15),

                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Denk je aan zelfmoord?',
                      style: GoogleFonts.inika(
                          fontSize: 18
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Bel 113',
                      style: linkTextStyle1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Text(
                      'Chat via:',
                      style: linkTextStyle1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 75),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(Icons.link_outlined),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchInBrowser(Uri.parse('https://www.113.nl/chatten'));
                          },
                          child: Text(
                            'https://www.113.nl/chatten',
                            style: linkTextStyle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Een luisterend oor?',
                      style: GoogleFonts.inika(
                          fontSize: 18
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: GestureDetector(
                      onTap: () {
                        _makePhoneCall('31880767000');
                      },
                      child: Text(
                        'Bel 088 0767 000',
                        style: GoogleFonts.inika(
                          color: const Color(0xFF7D7B79),
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Text(
                      'Chat via:',
                      style: linkTextStyle1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 75),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.link_outlined),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchInBrowser(Uri.parse('https://deluisterlijn.nl/'));
                          },
                          child: Text(
                            'https://deluisterlijn.nl/',
                            style: linkTextStyle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 15),

            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meer over mentale zorg',
                    style: GoogleFonts.inika(
                        fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 5),

                  ListTile(
                    title: Text(
                      '• https://moetiknaardedokter.nl/klacht/psychische-klachten',
                      style: linkTextStyle2,
                    ),
                    onTap: () => _launchInBrowser(Uri.parse('https://moetiknaardedokter.nl/klacht/psychische-klachten')),
                  ),
                  ListTile(
                    title: Text(
                      '• https://www.thuisarts.nl/psychische-klachten-bij-volwassene',
                      style: linkTextStyle2,
                    ),
                    onTap: () => _launchInBrowser(Uri.parse('https://www.thuisarts.nl/psychische-klachten-bij-volwassene')),
                  ),
                  ListTile(
                    title: Text(
                      '• https://www.thuisarts.nl/hulp-bij-psychische-klachten-bij-volwassenen/ik-heb-psychische-klachten-hoe-ga-ik-daar-mee-om',
                      style: linkTextStyle2,
                    ),
                    onTap: () => _launchInBrowser(Uri.parse('https://www.thuisarts.nl/hulp-bij-psychische-klachten-bij-volwassenen/ik-heb-psychische-klachten-hoe-ga-ik-daar-mee-om')),
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
