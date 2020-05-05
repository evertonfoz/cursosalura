mixin LoginPageMixin {
  isAValidEmail({String email}) {
    return email.trim().length > 0;
  }

  isAValidPassword({String password}) {
    return password.trim().length > 0;
  }

  isAValidForm({String email, String password}) {
    return (isAValidEmail(email: email) && isAValidPassword(password: password));
  }
}
