class LoginResponseModel {
  String accessToken;
  String expiresAtUtc;
  String refreshToken;

  LoginResponseModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'],
      expiresAtUtc: json['expiresAtUtc'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'expiresAtUtc': expiresAtUtc,
      'refreshToken': refreshToken,
    };
  }
}








// {
//     "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkNWFlMjViYy1kMjU4LTRiMmQtYjgzOC0wOGRlMmYyOTU4NmUiLCJqdGkiOiIyMWFjYzk1ZS03NjMzLTRhNWItYjMyNi1lNDYxNDM4MjY1MDkiLCJlbWFpbCI6InNlZmF3NTM4MDFAY2V4Y2guY29tIiwibmFtZSI6InlvdXNzZWYgaG9zc2FtIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzY0NjI1MzA5LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.y7AVJl0Vkigke3aGn51pwx2t-WRSUGKXlfmlmTws0-c",
//     "expiresAtUtc": "2025-12-01T21:41:49.5267803Z",
//     "refreshToken": "AmlLlFI6q1iPDcepwMQjNhHAusw2qSyhZlJPhFcbU8zCs+6WPVQ3Z+IY7RLCZZX8vXn93jW4yrRXUihUTVktaw=="
// }