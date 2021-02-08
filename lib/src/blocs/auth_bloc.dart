import 'dart:async';

import 'package:provider/provider.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Get Data
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  //taking the two streams and if thereIs a value coming out of them, it passes a validation
  //and the values coming out to UI >true / none
  Stream<bool> get isValid =>
      CombineLatestStream.combine2(email, password, (email, password) => true);

  //Set Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Dispose() {
    _email.close();
    _password.close();
  }

  //Transforms
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (regExpEmail.hasMatch(email.trim())) {
      sink.add(email.trim());
    } else {
      sink.addError('Must Be Valid Email Address');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password.trim());
    } else {
      sink.addError('8 Character Minimum');
    }
  });
}
