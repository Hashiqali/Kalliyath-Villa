import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';

List filtereditems = [];
void filterItems(String query, String filter) {
  if (query == '') {
    homebloc.add(Homerebuild());
  }
  filtereditems = villaDetails
      .where((item) =>
          item['name'].toLowerCase().contains(query.toLowerCase()) ||
          item.containsValue(filter == 'All' ? item['name'] : filter))
      .toList();
  homebloc.add(SearchGridbuilder(filtereditems: filtereditems));
}


