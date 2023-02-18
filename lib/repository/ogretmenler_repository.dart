import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/ogretmen.dart';
import '../services/data_service.dart';

class OgretmenlerRepository extends ChangeNotifier{

  List ogretmenler = [
    Ogretmen('Faruk', 'Yılmaz', 50, 'Erkek'),
    Ogretmen('Semiha', 'Çelik', 45, 'Kadın')
  ];

  final DataService dataService;
  OgretmenlerRepository(this.dataService);


  Future<void> indir() async {
    Ogretmen ogretmen = await dataService.ogretmenIndir();

    ogretmenler.add(ogretmen);
    notifyListeners();
  }

}

final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository(ref.watch(dataServiceProvider));
});


