import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp {
 static launchWhatsAppUri() async {
    final link = const WhatsAppUnilink(
      phoneNumber: '+254718258849',
      text: "Hello Oasis support team, I need assistance.",
    );

    await launchUrl (link.asUri());
  }
}

