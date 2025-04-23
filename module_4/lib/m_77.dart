import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class M77 extends StatefulWidget {
  const M77({super.key});

  @override
  State<M77> createState() => _M77State();
}

class _M77State extends State<M77> {
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M77'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              TextField(
                controller: _numberController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Number',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final number = _numberController.text;
                      if (number.isNotEmpty) {
                        sendSMS(number, 'Hello from Flutter!');
                        //Clipboard.setData(ClipboardData(text: number));
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('Number $number copied to clipboard'),
                        //   ),
                        // );
                      }
                    },
                    child: const Text('SMS'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final number = _numberController.text;
                      if (number.isNotEmpty) {
                        makePhoneCall(number);
                      }
                    },
                    child: const Text('Call'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> sendSMS(String phoneNumber, String message) async {
    final Uri uri = Uri(
      scheme: 'sms',
      path: '$phoneNumber',
      queryParameters: <String, String>{'body': message},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
