import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

import 'package:gunsel/data/sharedPreference.dart';

class AboutCompany extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutCompanyState();
  }
}

class AboutCompanyState extends State<AboutCompany> {
  SharePreferencelogin sh = SharePreferencelogin();
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  String aboutCompany = "About Gunsel Lines",
      aboutGunsel = "About Gunsel",
      line1 =
          "<<Gunsel Group>> company was formed in 1997, by starting its first transportation of passengers.\n\n",
      line2 =
          "Due to high professionalism of the team of the team and modern technical equipment the company soon diversified its activities by adding express- delivery of the email all over Ukraine.\n\n",
      line3 =
          "Late in 2015 the company got the license of \"Ukrainian Aviation Service\" for excercising international transits, and it began business with \"Turkish Airline Inc.\" that has largest covering in the world.\n\n",
      line4 =
          "As a result we deliver the cargo to every destination in the world at reasonable tariffs and with high-quality service\n\n",
      line5 =
          "A year later <<Gunsel Group>> comes to the world market of passenger transportation. In 2016 the first route \"KIEV - WARSAW\" started on regular basis.\n\n",
      line6 =
          "Having reached best results the <<Gunsel Group>> continues to expand routes map to perform transportation to other European countries\n\n",
      line7 =
          "We have been a leading company in road transportation for over 20 years.\n\n",
      line8 =
          "Professionalism, high quolity, performance responsibility, high level comfort and service in the main policy for <<Gunsel Group>> staff\n\n";
  @override
  void initState() {
    super.initState();

    aboutCompanylan();
  }

  void aboutCompanylan() async {
    enJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/en-US.json");
    uaJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ua-UA.json");
    ruJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ru-RU.json");
    plJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/pl-PL.json");

    Map<String, dynamic> enData = json.decode(enJson);
    Map<String, dynamic> uaData = json.decode(uaJson);
    Map<String, dynamic> ruData = json.decode(ruJson);
    Map<String, dynamic> plData = json.decode(plJson);

    int b;
    int a = await sh.getshared1();
    //print("Name is" + nameProfile);

    setState(() {
      b = a;

      if (b == 0) {
        aboutCompany = enData["about_gunsel_lines"];
        aboutGunsel = enData["about_gunsel"];
        line1 =
            "<<Gunsel Group>> company was formed in 1997, by starting its first transportation of passengers.\n\n";
        line2 =
            "Due to high professionalism of the team of the team and modern technical equipment the company soon diversified its activities by adding express- delivery of the email all over Ukraine.\n\n";
        line3 =
            "Late in 2015 the company got the license of \"Ukrainian Aviation Service\" for excercising international transits, and it began business with \"Turkish Airline Inc.\" that has largest covering in the world.\n\n";
        line4 =
            "As a result we deliver the cargo to every destination in the world at reasonable tariffs and with high-quality service\n\n";
        line5 =
            "A year later <<Gunsel Group>> comes to the world market of passenger transportation. In 2016 the first route \"KIEV - WARSAW\" started on regular basis.\n\n";
        line6 =
            "Having reached best results the <<Gunsel Group>> continues to expand routes map to perform transportation to other European countries\n\n";
        line7 =
            "We have been a leading company in road transportation for over 20 years.\n\n";
        line8 =
            "Professionalism, high quolity, performance responsibility, high level comfort and service in the main policy for <<Gunsel Group>> staff\n\n";
      } else if (b == 1) {
        aboutCompany = uaData["about_gunsel_lines"];
        aboutGunsel = uaData["about_gunsel"];
        line1 =
            "<< Компанія Gunsel Group >> була створена в 1997 році, розпочавши перші перевезення пасажирів.\n\n";
        line2 =
            "Через високий професіоналізм колективу та сучасне технічне обладнання компанія незабаром розширила свою діяльність, додавши експрес-доставку електронної пошти по всій Україні.\n\n";
        line3 =
            "Наприкінці 2015 року компанія отримала ліцензію \"Української авіаційної служби\" на здійснення міжнародних транзитів, і розпочала свою діяльність з \"Турецькою авіакомпанією Inc.\", яка має найбільше покриття у світі. \n\n";
        line4 =
            "В результаті ми доставляємо вантаж до будь-якого пункту світу за розумними тарифами та якісною послугою \n\n";
        line5 =
            "Через рік << Gunsel Group >> виходить на світовий ринок пасажирських перевезень. У 2016 році регулярно стартував перший маршрут \"КИЇВ - ВАРТА \".\n\n";
        line6 =
            "Досягнувши найкращих результатів, << Gunsel Group >> продовжує розширювати карту маршрутів, щоб здійснювати перевезення до інших європейських країн \n\n";
        line7 =
            "Ми вже 20 років є провідною компанією з автомобільних перевезень.\n\n";
        line8 =
            "Професіоналізм, висока якість, відповідальність за виконання, високий рівень комфорту та сервіс в основній політиці для << Gunsel Group >> співробітників \n\n";
      } else if (b == 2) {
        aboutCompany = ruData["about_gunsel_lines"];
        aboutGunsel = ruData["about_gunsel"];
        line1 =
            "Компания << Gunsel Group >> была основана в 1997 году, начав свою первую перевозку пассажиров.";
        line2 =
            "Благодаря высокому профессионализму команды и современному техническому оснащению, компания вскоре диверсифицировала свою деятельность, добавив экспресс-рассылку по всей Украине.\n\n";
        line3 =
            "В конце 2015 года компания получила лицензию \"Украинской авиационной службы \" на осуществление международных транзитных перевозок и начала бизнес с \"Turkish Airline Inc. \", которая имеет самое большое покрытие в мире. \n\n";
        line4 =
            "В результате мы доставляем груз в любую точку мира по разумным тарифам и с качественным обслуживанием \n\n";
        line5 =
            "Через год << Gunsel Group >> выходит на мировой рынок пассажирских перевозок. В 2016 году первый маршрут \"КИЕВ - ВАРШАВА \" стартовал на регулярной основе. \n\n";
        line6 =
            "Достигнув наилучших результатов, << Gunsel Group >> продолжает расширять карту маршрутов для осуществления перевозок в другие европейские страны \n\n";
        line7 =
            "Уже более 20 лет мы являемся ведущей компанией в сфере автомобильных перевозок. \n\n";

        line8 =
            "Профессионализм, высокое качество, ответственность за производительность, высокий уровень комфорта и сервиса в основной политике для сотрудников << Gunsel Group >> \n\n";
      } else if (b == 3) {
        aboutCompany = plData["about_gunsel_lines"];
        aboutGunsel = plData["about_gunsel"];
        line1 =
            "Firma << Gunsel Group >> powstała w 1997 roku, rozpoczynając pierwszy transport pasażerów.\n\n";
        line2 =
            "Ze względu na wysoki profesjonalizm zespołu i nowoczesny sprzęt techniczny firma szybko zdywersyfikowała działalność, dodając ekspresową dostawę wiadomości e-mail na całą Ukrainę.\n\n";
        line3 =
            "Pod koniec 2015 roku firma uzyskała licencję \"Ukraińska służba lotnicza\" na wykonywanie międzynarodowych tranzytów i rozpoczęła działalność z \"Turkish Airline Inc.\", która ma największe pokrycie na świecie. \n\n";
        line4 =
            "W rezultacie dostarczamy ładunek do każdego miejsca na świecie po rozsądnych taryfach i wysokiej jakości usługach \n\n";
        line5 =
            "Rok później << Gunsel Group >> wchodzi na światowy rynek transportu pasażerskiego. W 2016 r. Regularnie kursowała pierwsza trasa „KIJÓW - WARSZAWA”. \n\n";
        line6 =
            "Po osiągnięciu najlepszych wyników << Gunsel Group >> rozszerza mapę tras w celu wykonania transportu do innych krajów europejskich \n\n";
        line7 =
            "Od ponad 20 lat jesteśmy wiodącą firmą w transporcie drogowym. \n\n";
        line8 =
            "Profesjonalizm, wysoka jakość, odpowiedzialność za wydajność, wysoki poziom komfortu i obsługi w głównej polityce dla personelu << Gunsel Group >> \n\n";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      appBarTitle: aboutCompany,
      appBarTitleIncluded: true,
      drawerIncluded: true,
      backgroundImage: whiteImage,
      appBarColor: gunselColor,
      bodyWidget: Center(
          child: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text(
                  aboutGunsel,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: "Helvetica"),
                )),
            Container(
              child: Image(
                image: aboutImage,
              ),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: line1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line3,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line4,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line5,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line6,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line7,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
                TextSpan(
                    text: line8,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Helvetica")),
              ])),
            ),
          ],
        )
      ])),
    );
  }
}
