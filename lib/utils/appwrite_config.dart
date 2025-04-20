import 'package:appwrite/appwrite.dart';

final Client client = Client()
  .setEndpoint('https://api.yousearch.fr/v1')
  .setProject('67fedca9000be61c2419')
  .setSelfSigned(status: true); // TODO: Remove in production

final Account account = Account(client);