import 'package:http/http.dart';
import 'package:mvvm_practice/version_1/commands/command.dart';
import 'package:mvvm_practice/version_2/receivers/api_services.dart';

class GithubRequestCommand implements Command {
  GithubRequestCommand(ApiServices apiServices) {
    _apiServices = apiServices;
  }

  @override
  Future<Response> execute() {
    return _apiServices.github();
  }

  late ApiServices _apiServices;
}