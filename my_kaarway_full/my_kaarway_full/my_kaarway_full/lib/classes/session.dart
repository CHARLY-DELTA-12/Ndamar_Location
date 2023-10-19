import 'package:flutter_session_manager/flutter_session_manager.dart';

var session = SessionManager();

void setUserId(int userId) async {
  await session.set('user_id', userId);
}

getUserId() async {
  int userId = await session.get('user_id');
  return userId;
}

void setUserProfile(String userProfile) async {
  await session.set('user_id', userProfile);
}

getUserProfile() async {
  String userProfile = await session.get('user_id');
  return userProfile;
}
