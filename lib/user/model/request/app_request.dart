class AppRequest {
  Map<String, String> createAccount(String phoneNumber, String accountType,
      String password, String role, String email) {
    return {
      "email": email,
      "password": password,
      "role": role,
      "accountType": accountType,
      "phoneNumber": phoneNumber
    };
  }

  Map<String, String> login(String password, String email) {
    return {"email": email, "password": password};
  }

  Map<String, String> verifyOTP(String otp, String email) {
    return {"email": email, "otp": otp};
  }
    Map<String, String> resend(String email) {
    return {"email": email};
  }
}
