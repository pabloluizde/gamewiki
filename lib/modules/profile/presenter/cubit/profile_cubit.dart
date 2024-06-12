import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/profile/presenter/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
  var opacityLevel = 0.0;
  final list = [
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Não gostei muito do online, cheio de problemas que poderiam ser ajustados"',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
    '"Gostei bastante do modo campanha! Super divertido e da pra passar horas jogando."',
  ];
}
