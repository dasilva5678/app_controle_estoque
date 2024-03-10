abstract class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ExceptionRequest extends CustomException {
  ExceptionRequest() : super('Ops. Parece que algo deu errado!');
}

class BoxNotFound extends CustomException {
  BoxNotFound() : super('Box não encontrado!');
}

class EmailAlreadyExists extends CustomException {
  EmailAlreadyExists() : super('Email já cadastrado!');
}

class EmailNotFound extends CustomException {
  EmailNotFound() : super('Email não encontrado!');
}

class EmailAndPasswordNotMatch extends CustomException {
  EmailAndPasswordNotMatch() : super('Email e senha não conferem!');
}

class PasswordNotMatch extends CustomException {
  PasswordNotMatch() : super('Senha incorreta!');
}
class AuditNotFound extends CustomException {
  AuditNotFound() : super('Auditoria não encontrada!');
}
