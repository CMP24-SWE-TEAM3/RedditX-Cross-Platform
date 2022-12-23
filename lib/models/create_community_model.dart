import 'package:flutter/material.dart';

///list of create Community type Sheet titles
List<String> createCommunitySheetTitle = ["public", "restricted", "private"];

///list of create Community type Sheet descriptions
List<String> createCommunitySheetDescription = [
  "Anyone can view, post and comment to this community",
  "Anyone can view this community, but only approved user can post",
  "Only approved users can view and submit to this community"
];

///list of create Community type Sheet Icons
List<IconData> createCommunitySheetIcons = [
  Icons.person_pin_circle_outlined,
  Icons.check_circle_outline,
  Icons.lock
];

///community rules
String? communityRules =
    "Rules are different for each community. Reviewing the rules can help you be more\nsuccessful when posting or commenting in this community.\n\n1. Remember the human\n2. Abide by community rules\n3. Respect the privacy of others\n4. Don't impersonate people or entities\n5. Properly label Not Safe for Work (NSFW) content\n6. Keep it legal\n7. Don't break Reddit (a lot of us really like it here)";
