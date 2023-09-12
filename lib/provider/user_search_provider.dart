import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/models/user_data_model.dart';



final filteredUserListProvider = StateProvider<List<UserDataModel>>((ref) => []);

