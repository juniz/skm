import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:SKM/connect/koneksi.dart';
import 'package:get/get.dart';

class PageOneController extends GetxController {
  var gender = ''.obs;
  var pendidikan = ''.obs;
  var job = ''.obs;
  var service = ''.obs;
  var pelayanan = ''.obs;
  var prosedur = ''.obs;
  var kecepatan = ''.obs;
  var tarif = ''.obs;
  var produk = ''.obs;
  var kompetensi = ''.obs;
  var perilaku = ''.obs;
  var sarana = ''.obs;
  var pengaduan = ''.obs;
  TextEditingController nama;
  TextEditingController telp;
  TextEditingController saran;
  var data1 = Map<dynamic, String>().obs;
  var date = DateTime.now();
  var isLoading = false.obs;

  @override
  void onInit() {
    nama = new TextEditingController();
    telp = new TextEditingController();
    saran = new TextEditingController();
    super.onInit();
  }

  Future<bool> next() async {
    if (gender.value != '' &&
        pendidikan.value != '' &&
        job.value != '' &&
        service.value != '' &&
        nama.text.isNotEmpty &&
        telp.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> next1() async {
    if (pelayanan.value != '' &&
        prosedur.value != '' &&
        kecepatan.value != '' &&
        tarif.value != '' &&
        produk.value != '') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> next2() async {
    if (kompetensi.value != '' &&
        perilaku.value != '' &&
        sarana.value != '' &&
        pengaduan.value != '') {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    gender.value = '';
    pendidikan.value = '';
    job.value = '';
    service.value = '';
    pelayanan.value = '';
    prosedur.value = '';
    kecepatan.value = '';
    tarif.value = '';
    produk.value = '';
    kompetensi.value = '';
    perilaku.value = '';
    sarana.value = '';
    pengaduan.value = '';
    nama.clear();
    telp.clear();
    saran.clear();
  }

  Future<String> submit() async {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false),
    );
    try {
      var data = await Koneksi().kirim(
          'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/skm',
          {
            'nama': nama.text.toUpperCase(),
            'telp': telp.text,
            'jk': gender.value,
            'pendidikan': pendidikan.value,
            'pekerjaan': job.value,
            'layanan': service.value,
            'p1': pelayanan.value,
            'p2': prosedur.value,
            'p3': kecepatan.value,
            'p4': tarif.value,
            'p5': produk.value,
            'p6': kompetensi.value,
            'p7': perilaku.value,
            'p8': sarana.value,
            'p9': pengaduan.value,
            'saran': saran.text == '' ? '-' : saran.text
          });
      if (data.statusCode == 200) {
        Get.back();
        return 'sukses';
      } else if (data.statusCode == 404) {
        Get.back();
        return 'duplicate';
      } else {
        Get.back();
        return 'gagal';
      }
    } on Exception catch (e) {
      Get.back();
      return 'gagal';
    }
  }
}
