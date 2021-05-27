import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:SKM/constants.dart';

import 'controller/pageOne.dart';

class PageOne extends StatefulWidget {
  final Function onLogInSelected;
  final Function onSignUpSelected;

  PageOne({@required this.onLogInSelected, @required this.onSignUpSelected});
  @override
  _PageOneState createState() => _PageOneState();
}

final controller = Get.put(PageOneController());

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool phone = context.isPhone;
    bool tablet = context.isTablet;

    return Padding(
      padding: EdgeInsets.all(phone
          ? 16
          : tablet
              ? 32
              : 64),
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.8
                    : size.height > 670
                        ? 0.8
                        : 0.8),
            width: phone
                ? size.width
                : tablet
                    ? size.width * 0.9
                    : size.width * 0.5,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SURVEY KEPUASAN MASYARAKAT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: size.width / 2,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '6. Bagaimana Pendapat Saudara Tentang Kompetensi / Kemampuan Petugas Dalam Pelayanan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.kompetensi.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Kompeten',
                              'Kurang Kompeten',
                              'Kompeten',
                              'Sangat Kompeten'
                            ],
                            onChanged: (value) =>
                                controller.kompetensi.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '7. Bagaimana Pendapat Saudara Tentang Perilaku Petugas Terkait Kesopanan dan Keramahan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.perilaku.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Sopan dan Ramah',
                              'Kurang Sopan dan Ramah',
                              'Sopan dan Ramah',
                              'Sangat Sopan dan Ramah'
                            ],
                            onChanged: (value) =>
                                controller.perilaku.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '8. Bagaimana Pendapat Saudara Tentang Kualitas Sarana dan Prasarana',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.sarana.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: ['Buruk', 'Cukup', 'Baik', 'Sangat Baik'],
                            onChanged: (value) =>
                                controller.sarana.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '9. Bagaimana Pendapat Saudara Tentang Penanganan Pengaduan Pengguna Layanan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.pengaduan.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Ada',
                              'Ada Tetapi Tidak Berfungsi',
                              'Berfungsi Kurang Maksimal',
                              'DIkelola Dengan Baik'
                            ],
                            onChanged: (value) =>
                                controller.pengaduan.value = value,
                          )),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          maxLines: 2,
                          controller: controller.saran,
                          decoration: InputDecoration(
                            labelText: '10. Saran',
                            suffixIcon: Icon(Icons.book),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onSignUpSelected();
                            },
                            child: Container(
                              height: 50,
                              width: size.width / 4,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: kPrimaryColor.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Kembali',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              var cek = await controller.next2();
                              print(cek);
                              print(controller.kompetensi.value);
                              if (cek == false) {
                                Get.snackbar("Peringatan !",
                                    'Ada data yang masih kosong',
                                    backgroundColor: Colors.greenAccent);
                              } else {
                                var temp = await controller.submit();
                                if (temp == 'sukses') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.NO_HEADER,
                                    headerAnimationLoop: false,
                                    animType: AnimType.SCALE,
                                    title: 'Berhasil',
                                    desc: 'Terima kasih atas partisipasinya',
                                    autoHide: Duration(seconds: 3),
                                  )..show();
                                  Future.delayed(Duration(seconds: 5), () {
                                    controller.reset();
                                    widget.onLogInSelected();
                                  });
                                } else if (temp == 'duplicate') {
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.NO_HEADER,
                                      animType: AnimType.RIGHSLIDE,
                                      headerAnimationLoop: false,
                                      title: 'Gagal',
                                      desc:
                                          'Kemungkinan nama sudah digunakan. Silahkan pakai nama yang lain.',
                                      btnOkOnPress: () {},
                                      btnOkIcon: Icons.cancel,
                                      btnOkColor: Colors.red)
                                    ..show();
                                } else {
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.NO_HEADER,
                                      animType: AnimType.RIGHSLIDE,
                                      headerAnimationLoop: false,
                                      title: 'Gagal',
                                      desc: 'Gagal melakukan input.',
                                      btnOkOnPress: () {},
                                      btnOkIcon: Icons.cancel,
                                      btnOkColor: Colors.red)
                                    ..show();
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              width: size.width / 4,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: kPrimaryColor.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Selesai',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
