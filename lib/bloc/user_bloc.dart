import 'package:bloc/bloc.dart';
import 'package:mvvm/model/user.dart';

class UserBloc extends Bloc<int, User> {
  UserBloc() : super(UninitializedUser());

  @override
  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.getUserFromAPI(event);
      yield user;
    } catch (e) {
      print(e);
    }
  }
}
