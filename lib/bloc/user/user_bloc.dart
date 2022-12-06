import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:estados/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivateUserEvent>((event, emit) => emit(UserSetState(event.user)));

    on<DeleteUserEvent>((_, emit) => emit(UserInitialState()));

    on<ChangeUserAgeEvent>((event, emit){
      if(!state.existUser) return;
      emit(UserSetState(state.user!.copyWidth(edad: event.age)));

    });

    on<AddProfessionEvent>((event, emit) {
      if(!state.existUser) return;
      final professions = [...state.user!.profesiones, event.profession];
      emit(UserSetState(state.user!.copyWidth(profesiones: professions)));
    });

    on<ChangeUserNameEvent>((event, emit) {
      if(!state.existUser) return;
      emit(UserSetState(state.user!.copyWidth(nombre: event.name)));
    });

    on<ResetUserDataEvent>((event, emit) {
      if(!state.existUser) return;
      emit(UserSetState(event.user));
    });
  }
}
