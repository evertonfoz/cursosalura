mixin LoginPageMixin {
  isAValidEmail({String email}) {
    return email.trim().length > 0;
  }

  isAValidPassword({String password}) {
    return password.trim().length > 0;
  }
}
