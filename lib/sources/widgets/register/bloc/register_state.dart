// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState {
  String name;
  String email;
  String password;
  String verifyPassword;
  String requestMessage;
  bool showPassword;
  bool showConfirmPassword;
  RegisterStatus status;
  RegisterEnum statusRequest;

  RegisterState({
    required this.name,
    required this.email,
    required this.password,
    required this.verifyPassword,
    required this.requestMessage,
    required this.showPassword,
    required this.showConfirmPassword,
    required this.status,
    required this.statusRequest,
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? verifyPassword,
    String? requestMessage,
    bool? showPassword,
    bool? showConfirmPassword,
    RegisterStatus? status,
    RegisterEnum? statusRequest,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      verifyPassword: verifyPassword ?? this.verifyPassword,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      status: status ?? this.status,
      statusRequest: statusRequest ?? this.statusRequest,
      requestMessage: requestMessage ?? this.requestMessage,
    );
  }
}

class RegisterStateInitial extends RegisterState {
  RegisterStateInitial()
      : super(
          email: '',
          name: '',
          password: '',
          verifyPassword: '',
          requestMessage: '',
          showPassword: true,
          showConfirmPassword: true,
          status: RegisterStatus.idle,
          statusRequest: RegisterEnum.idle,
        );
}
