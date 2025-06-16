// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Choose type`
  String get chooseType {
    return Intl.message('Choose type', name: 'chooseType', desc: '', args: []);
  }

  /// `Seller`
  String get vendor {
    return Intl.message('Seller', name: 'vendor', desc: '', args: []);
  }

  /// `Buyer`
  String get buyer {
    return Intl.message('Buyer', name: 'buyer', desc: '', args: []);
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message('Sign up', name: 'signup', desc: '', args: []);
  }

  /// `Name`
  String get hintName {
    return Intl.message('Name', name: 'hintName', desc: '', args: []);
  }

  /// `Email`
  String get hintEmail {
    return Intl.message('Email', name: 'hintEmail', desc: '', args: []);
  }

  /// `Phone number`
  String get hintPhone {
    return Intl.message('Phone number', name: 'hintPhone', desc: '', args: []);
  }

  /// `Password`
  String get hintPass {
    return Intl.message('Password', name: 'hintPass', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Forgot your password?`
  String get forgetPass {
    return Intl.message(
      'Forgot your password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get notHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Select type`
  String get type {
    return Intl.message('Select type', name: 'type', desc: '', args: []);
  }

  /// `Resend`
  String get resendEmail {
    return Intl.message('Resend', name: 'resendEmail', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Field`
  String get field {
    return Intl.message('Field', name: 'field', desc: '', args: []);
  }

  /// `User already exists`
  String get userAlreadyExists {
    return Intl.message(
      'User already exists',
      name: 'userAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create account`
  String get failedToCreateAccount {
    return Intl.message(
      'Failed to create account',
      name: 'failedToCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get loginSuccessful {
    return Intl.message(
      'Login Successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Password incorrect`
  String get passwordIncorrect {
    return Intl.message(
      'Password incorrect',
      name: 'passwordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `This user does not exist`
  String get thisUserDoesNotExist {
    return Intl.message(
      'This user does not exist',
      name: 'thisUserDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `There was an error processing your request`
  String get errorRequest {
    return Intl.message(
      'There was an error processing your request',
      name: 'errorRequest',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter verification code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `We have send code to`
  String get weHaveSendCodeTo {
    return Intl.message(
      'We have send code to',
      name: 'weHaveSendCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get weakPassword {
    return Intl.message(
      'Weak password',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Send to email success`
  String get sendToEmailSuccess {
    return Intl.message(
      'Send to email success',
      name: 'sendToEmailSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Send link verification to`
  String get sendLinkVerificationYourEmailTo {
    return Intl.message(
      'Send link verification to',
      name: 'sendLinkVerificationYourEmailTo',
      desc: '',
      args: [],
    );
  }

  /// `Verify success`
  String get verifySuccess {
    return Intl.message(
      'Verify success',
      name: 'verifySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Didn't get a code?`
  String get didNotGetACode {
    return Intl.message(
      'Didn\'t get a code?',
      name: 'didNotGetACode',
      desc: '',
      args: [],
    );
  }

  /// `Click to resend`
  String get clickToResend {
    return Intl.message(
      'Click to resend',
      name: 'clickToResend',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code`
  String get invalidVerificationCode {
    return Intl.message(
      'Invalid verification code',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Code not send success`
  String get codeNotSendSuccess {
    return Intl.message(
      'Code not send success',
      name: 'codeNotSendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Code send successfully`
  String get codeSendSuccessfully {
    return Intl.message(
      'Code send successfully',
      name: 'codeSendSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Re password`
  String get rePassword {
    return Intl.message('Re password', name: 'rePassword', desc: '', args: []);
  }

  /// `Change password successful`
  String get changePasswordSuccessful {
    return Intl.message(
      'Change password successful',
      name: 'changePasswordSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Change password failed`
  String get changePasswordFailed {
    return Intl.message(
      'Change password failed',
      name: 'changePasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Food name`
  String get foodName {
    return Intl.message('Food name', name: 'foodName', desc: '', args: []);
  }

  /// `Food description`
  String get foodDesc {
    return Intl.message(
      'Food description',
      name: 'foodDesc',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get foodCost {
    return Intl.message('EGP', name: 'foodCost', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Add food`
  String get addFood {
    return Intl.message('Add food', name: 'addFood', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Your orders`
  String get yourOrders {
    return Intl.message('Your orders', name: 'yourOrders', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Order number: `
  String get orderNumber {
    return Intl.message(
      'Order number: ',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get orderDetails {
    return Intl.message(
      'Order details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Phone number:`
  String get phoneNumber {
    return Intl.message(
      'Phone number:',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get pm {
    return Intl.message('PM', name: 'pm', desc: '', args: []);
  }

  /// `AM`
  String get am {
    return Intl.message('AM', name: 'am', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Your order`
  String get yourOrder {
    return Intl.message('Your order', name: 'yourOrder', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Order total`
  String get orderTotal {
    return Intl.message('Order total', name: 'orderTotal', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Account information`
  String get accountInformation {
    return Intl.message(
      'Account information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Your addresses`
  String get addresses {
    return Intl.message(
      'Your addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Edit name`
  String get editName {
    return Intl.message('Edit name', name: 'editName', desc: '', args: []);
  }

  /// `m`
  String get minute {
    return Intl.message('m', name: 'minute', desc: '', args: []);
  }

  /// `h`
  String get hour {
    return Intl.message('h', name: 'hour', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Total Cart`
  String get totalBasket {
    return Intl.message('Total Cart', name: 'totalBasket', desc: '', args: []);
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message('Add to cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
