import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:SKM/constants.dart';

import 'controller/pageOne.dart';

class SignUp extends StatefulWidget {
  final Function onLogInSelected;
  final Function onPageOneSelected;
  SignUp({@required this.onLogInSelected, @required this.onPageOneSelected});

  @override
  _SignUpState createState() => _SignUpState();
}

final controller = Get.put(PageOneController());

class _SignUpState extends State<SignUp> {
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
                        textAlign: TextAlign.center,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '1. Bagaimana Pendapat Saudara Tentang Kesesuaian Persyaratan Pelayanan Dengan Jenis Pelayanannya',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.pelayanan.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Sesuai',
                              'Kurang Sesuai',
                              'Sesuai',
                              'Sangat Sesuai'
                            ],
                            onChanged: (value) =>
                                controller.pelayanan.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '2. Bagaimana Pemahaman Saudara Tentang Kemudahan Prosedur Pelayanan Di Unit ini',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.prosedur.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Mudah',
                              'Kurang Mudah',
                              'Mudah',
                              'Sangat Mudah'
                            ],
                            onChanged: (value) =>
                                controller.prosedur.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '3. Bagaimana Pendapat Saudara Tentang Kecepatan Waktu Dalam Memberikan Pelayanan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.kecepatan.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Cepat',
                              'Kurang Cepat',
                              'Cepat',
                              'Sangat Cepat'
                            ],
                            onChanged: (value) =>
                                controller.kecepatan.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '4. Bagaimana Pendapat Saudara Tentang Kewajaran Biaya / Tarif Dalam Pelayanan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.tarif.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Sangat Mahal',
                              'Cukup Mahal',
                              'Mahal',
                              'Gratis'
                            ],
                            onChanged: (value) =>
                                controller.tarif.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '5. Bagaimana Menurut Saudara Tentang Kesesuaian Produk Pelayanan Antara Yang Tercantum Dalam Standar Pelayanan Dengan Hasil Yang Diberikan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.produk.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'Tidak Sesuai',
                              'Kurang Sesuai',
                              'Sesuai',
                              'Sangat Sesuai'
                            ],
                            onChanged: (value) =>
                                controller.produk.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onLogInSelected();
                            },
                            child: Container(
                              height: 50,
                              width: size.width / 3.5,
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
                              var temp = await controller.next1();
                              print(temp);
                              if (temp) {
                                widget.onPageOneSelected();
                              } else {
                                Get.snackbar("Peringatan !",
                                    'Ada data yang masih kosong',
                                    backgroundColor: Colors.greenAccent);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: size.width / 3.5,
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
                                  'Lanjut',
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
