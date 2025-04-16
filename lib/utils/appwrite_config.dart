import 'package:appwrite/appwrite.dart';

// Initialize Appwrite client
final Client client = Client()
  .setEndpoint('https://api.yousearch.fr/v1')
  .setProject('67fedca9000be61c2419')
  .setSelfSigned(status: true); // Remove in production

// Initialize Appwrite account instance
final Account account = Account(client);