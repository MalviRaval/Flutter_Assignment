import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart' as UrlLauncher;

class M72 extends StatefulWidget {
  const M72({super.key});

  @override
  State<M72> createState() => _M72State();
}

class _M72State extends State<M72> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Phone call App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: 'Enter the phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_phoneNumberController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter a phone number"),
                      ));
                      return;
                    }
                    String phoneNumber = _phoneNumberController.text.trim();
                    _phoneNumberController.clear();
                    _makePhoneCallWithPermission(phoneNumber, context);
                  },
                  child: Text('Phone call')),
            ],
          ),
        ),
      ),
    );
  }
Future<bool> _requestPhonePermission() async {
  PermissionStatus status = await Permission.phone.request();
  return status.isGranted;
}

Future<bool> _checkPhonePermission() async {
  PermissionStatus status = await Permission.phone.status;
  return status.isGranted;
}

Future<void> _makePhoneCallWithPermission(String phoneNumber, BuildContext context) async {
  if (await _checkPhonePermission()) {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch the phone dialer.')),
      );
    }
  } else {
    // Permission not granted, request it
    if (await _requestPhonePermission()) {
      final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch the phone dialer.')),
        );
      }
    } else {
      // Permission denied after request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Phone call permission was denied.')),
      );
      // Optionally, you can guide the user to the app settings to enable it manually.
      openAppSettings();
    }
  }
}
}
