import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:SKM/constants.dart';
import 'package:SKM/controller/pageOne.dart';
import 'package:smart_select/smart_select.dart';

class LogIn extends StatefulWidget {
  final Function onSignUpSelected;

  LogIn({@required this.onSignUpSelected});

  @override
  _LogInState createState() => _LogInState();
}

final controller = Get.put(PageOneController());

class _LogInState extends State<LogIn> {
  String gender = 'L';
  String pendidikan = 'SD Kebawah';
  String job = 'PNS';
  String service = 'POLIKLINIK';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'L', title: 'Laki-Laki'),
    S2Choice<String>(value: 'P', title: 'Perempuan'),
  ];
  List<S2Choice<String>> optionsPendidikan = [
    S2Choice<String>(value: 'SD Kebawah', title: 'SD Kebawah'),
    S2Choice<String>(value: 'SMP', title: 'SMP'),
    S2Choice<String>(value: 'SMA/SMK Sederajat', title: 'SMA/SMK Sederajat'),
    S2Choice<String>(value: 'S1', title: 'S1'),
    S2Choice<String>(value: 'S2', title: 'S2'),
    S2Choice<String>(value: 'S3', title: 'S3'),
  ];
  List<S2Choice<String>> optionsJobs = [
    S2Choice<String>(value: 'PNS', title: 'PNS'),
    S2Choice<String>(value: 'Swasta', title: 'Swasta'),
    S2Choice<String>(value: 'TNI', title: 'TNI'),
    S2Choice<String>(value: 'Wirausaha', title: 'Wirausaha'),
    S2Choice<String>(value: 'POLRI', title: 'POLRI'),
  ];
  List<S2Choice<String>> optionsServices = [
    S2Choice<String>(value: 'POLIKLINIK', title: 'POLIKLINIK'),
    S2Choice<String>(value: 'IGD', title: '(IGD) INSTALASI GAWAT DARURAT'),
    S2Choice<String>(value: 'FLAMBOYAN', title: 'R. FLAMBOYAN'),
    S2Choice<String>(value: 'DAHLIA', title: 'R. DAHLIA'),
    S2Choice<String>(value: 'ANGGREK', title: 'R. ANGGREK'),
    S2Choice<String>(value: 'NEONATUS', title: 'R. NEONATUS'),
  ];
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
                      // SizedBox(
                      //   height: 8,
                      // ),
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
                      TextField(
                        controller: controller.nama,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.telp,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'No. Handphone',
                          suffixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jenis Kelamin',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            horizontalAlignment: MainAxisAlignment.spaceEvenly,
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.gender.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: ['Laki-Laki', 'Perempuan'],
                            onChanged: (value) =>
                                controller.gender.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pendidikan Terakhir',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            // horizontalAlignment: MainAxisAlignment.start,
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.pendidikan.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'SD Kebawah',
                              'SMP',
                              'SMA/SMK Sederajat',
                              'S1',
                              'S2',
                              'S3'
                            ],
                            onChanged: (value) =>
                                controller.pendidikan.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pekerjaan Utama',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            // horizontalAlignment: MainAxisAlignment.start,
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.job.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'PNS',
                              'Swasta',
                              'TNI',
                              'Wirausaha',
                              'POLRI'
                            ],
                            onChanged: (value) => controller.job.value = value,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jenis Layanan Yang Diterima',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Obx(() => RadioGroup<String>.builder(
                            // horizontalAlignment: MainAxisAlignment.start,
                            direction: phone ? Axis.vertical : Axis.horizontal,
                            groupValue: controller.service.value,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            items: [
                              'POLIKLINIK',
                              'IGD',
                              'FLAMBOYAN',
                              'DAHLIA',
                              'ANGGREK',
                              'NEONATUS'
                            ],
                            onChanged: (value) =>
                                controller.service.value = value,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              controller.reset();
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
                                  'Hapus',
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
                              var temp = await controller.next();
                              if (temp) {
                                widget.onSignUpSelected();
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
                        height: 32,
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
