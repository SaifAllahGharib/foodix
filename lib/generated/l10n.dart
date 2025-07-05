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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  /// `Select Language`
  String get selectLang {
    return Intl.message(
      'Select Language',
      name: 'selectLang',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Preferred Language`
  String get chooseYourPreferredLanguage {
    return Intl.message(
      'Choose Your Preferred Language',
      name: 'chooseYourPreferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `Select Your Role`
  String get selectRole {
    return Intl.message(
      'Select Your Role',
      name: 'selectRole',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get vendor {
    return Intl.message('Seller', name: 'vendor', desc: '', args: []);
  }

  /// `Buyer`
  String get buyer {
    return Intl.message('Buyer', name: 'buyer', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Name`
  String get labelName {
    return Intl.message('Name', name: 'labelName', desc: '', args: []);
  }

  /// `Email`
  String get labelEmail {
    return Intl.message('Email', name: 'labelEmail', desc: '', args: []);
  }

  /// `Phone Number`
  String get labelPhone {
    return Intl.message('Phone Number', name: 'labelPhone', desc: '', args: []);
  }

  /// `Password`
  String get labelPass {
    return Intl.message('Password', name: 'labelPass', desc: '', args: []);
  }

  /// `Confirm Password`
  String get labelConfPass {
    return Intl.message(
      'Confirm Password',
      name: 'labelConfPass',
      desc: '',
      args: [],
    );
  }

  /// `Saif`
  String get hintName {
    return Intl.message('Saif', name: 'hintName', desc: '', args: []);
  }

  /// `example@ex.com`
  String get hintEmail {
    return Intl.message(
      'example@ex.com',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `01012345678`
  String get hintPhone {
    return Intl.message('01012345678', name: 'hintPhone', desc: '', args: []);
  }

  /// `***********`
  String get hintPass {
    return Intl.message('***********', name: 'hintPass', desc: '', args: []);
  }

  /// `Already Have an Account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already Have an Account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Forgot Your Password?`
  String get forgetPass {
    return Intl.message(
      'Forgot Your Password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have an Account?`
  String get notHaveAccount {
    return Intl.message(
      'Don\'t Have an Account?',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Select Type`
  String get type {
    return Intl.message('Select Type', name: 'type', desc: '', args: []);
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

  /// `User Already Exists`
  String get userAlreadyExists {
    return Intl.message(
      'User Already Exists',
      name: 'userAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Create Account`
  String get failedToCreateAccount {
    return Intl.message(
      'Failed to Create Account',
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

  /// `Incorrect Password`
  String get passwordIncorrect {
    return Intl.message(
      'Incorrect Password',
      name: 'passwordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `This User Does Not Exist`
  String get thisUserDoesNotExist {
    return Intl.message(
      'This User Does Not Exist',
      name: 'thisUserDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `An Error Occurred While Processing Your Request`
  String get errorRequest {
    return Intl.message(
      'An Error Occurred While Processing Your Request',
      name: 'errorRequest',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter Verification Code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `We Sent the Code to`
  String get weHaveSendCodeTo {
    return Intl.message(
      'We Sent the Code to',
      name: 'weHaveSendCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password`
  String get weakPassword {
    return Intl.message(
      'Weak Password',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Sent to Email Successfully`
  String get sendToEmailSuccess {
    return Intl.message(
      'Sent to Email Successfully',
      name: 'sendToEmailSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verification Link Sent to`
  String get sendLinkVerificationYourEmailTo {
    return Intl.message(
      'Verification Link Sent to',
      name: 'sendLinkVerificationYourEmailTo',
      desc: '',
      args: [],
    );
  }

  /// `Verification Successful`
  String get verifySuccess {
    return Intl.message(
      'Verification Successful',
      name: 'verifySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Didn't Receive a Code?`
  String get didNotGetACode {
    return Intl.message(
      'Didn\'t Receive a Code?',
      name: 'didNotGetACode',
      desc: '',
      args: [],
    );
  }

  /// `Click to Resend`
  String get clickToResend {
    return Intl.message(
      'Click to Resend',
      name: 'clickToResend',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Verification Code`
  String get invalidVerificationCode {
    return Intl.message(
      'Invalid Verification Code',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Send Code`
  String get codeNotSendSuccess {
    return Intl.message(
      'Failed to Send Code',
      name: 'codeNotSendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Code Sent Successfully`
  String get codeSendSuccessfully {
    return Intl.message(
      'Code Sent Successfully',
      name: 'codeSendSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get rePassword {
    return Intl.message(
      'Repeat Password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get changePasswordSuccessful {
    return Intl.message(
      'Password Changed Successfully',
      name: 'changePasswordSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Change Password`
  String get changePasswordFailed {
    return Intl.message(
      'Failed to Change Password',
      name: 'changePasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Food Name`
  String get foodName {
    return Intl.message('Food Name', name: 'foodName', desc: '', args: []);
  }

  /// `Food Description`
  String get foodDesc {
    return Intl.message(
      'Food Description',
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

  /// `Add Food`
  String get addFood {
    return Intl.message('Add Food', name: 'addFood', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Your Orders`
  String get yourOrders {
    return Intl.message('Your Orders', name: 'yourOrders', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Order Number:`
  String get orderNumber {
    return Intl.message(
      'Order Number:',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number:`
  String get phoneNumber {
    return Intl.message(
      'Phone Number:',
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

  /// `Your Order`
  String get yourOrder {
    return Intl.message('Your Order', name: 'yourOrder', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Order Total`
  String get orderTotal {
    return Intl.message('Order Total', name: 'orderTotal', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Your Addresses`
  String get addresses {
    return Intl.message(
      'Your Addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `min`
  String get minute {
    return Intl.message('min', name: 'minute', desc: '', args: []);
  }

  /// `hr`
  String get hour {
    return Intl.message('hr', name: 'hour', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Total Cart`
  String get totalBasket {
    return Intl.message('Total Cart', name: 'totalBasket', desc: '', args: []);
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `My Restaurant`
  String get myRestaurant {
    return Intl.message(
      'My Restaurant',
      name: 'myRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `Complete Your Restaurant`
  String get completeYourRestaurant {
    return Intl.message(
      'Complete Your Restaurant',
      name: 'completeYourRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `To Proceed, Please Complete Your Restaurant Details Including Name, Address, and Categories.`
  String get toProceedPlease {
    return Intl.message(
      'To Proceed, Please Complete Your Restaurant Details Including Name, Address, and Categories.',
      name: 'toProceedPlease',
      desc: '',
      args: [],
    );
  }

  /// `Got It`
  String get gotIt {
    return Intl.message('Got It', name: 'gotIt', desc: '', args: []);
  }

  /// `New Name`
  String get newName {
    return Intl.message('New Name', name: 'newName', desc: '', args: []);
  }

  /// `Save Restaurant`
  String get saveRestaurant {
    return Intl.message(
      'Save Restaurant',
      name: 'saveRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Info`
  String get restaurantInfo {
    return Intl.message(
      'Restaurant Info',
      name: 'restaurantInfo',
      desc: '',
      args: [],
    );
  }

  /// `Burger King`
  String get hintNameRestaurant {
    return Intl.message(
      'Burger King',
      name: 'hintNameRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `30 min`
  String get hintDeliveryTime {
    return Intl.message('30 min', name: 'hintDeliveryTime', desc: '', args: []);
  }

  /// `15 EGP`
  String get hintDeliveryCost {
    return Intl.message('15 EGP', name: 'hintDeliveryCost', desc: '', args: []);
  }

  /// `Delivery Time`
  String get labelDeliveryTime {
    return Intl.message(
      'Delivery Time',
      name: 'labelDeliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Cost`
  String get labelDeliveryCost {
    return Intl.message(
      'Delivery Cost',
      name: 'labelDeliveryCost',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message('Select Time', name: 'selectTime', desc: '', args: []);
  }

  /// `Open Time`
  String get openTime {
    return Intl.message('Open Time', name: 'openTime', desc: '', args: []);
  }

  /// `Close Time`
  String get closeTime {
    return Intl.message('Close Time', name: 'closeTime', desc: '', args: []);
  }

  /// `Choose an action`
  String get chooseAnAction {
    return Intl.message(
      'Choose an action',
      name: 'chooseAnAction',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to edit or delete this item?`
  String get doYouWantToEditOrDeleteThisItem {
    return Intl.message(
      'Do you want to edit or delete this item?',
      name: 'doYouWantToEditOrDeleteThisItem',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Deleted Successfully`
  String get deleteSuccess {
    return Intl.message(
      'Deleted Successfully',
      name: 'deleteSuccess',
      desc: '',
      args: [],
    );
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
