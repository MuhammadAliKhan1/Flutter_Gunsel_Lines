import 'dart:io';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/sharedPreference.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as paths;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';






class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SharePreferencelogin sh = SharePreferencelogin();
  final facebookLogins = FacebookLogin();
  final googleSignins = GoogleSignIn();

  String editProfileInformation = "Edit Profile Information",
      firstName = "First Name",
      lastName = "Last Name",
      email = "Email",
      phoneNumber = "Phone Number",
      btnSaveChange = "Save Changes",
      profile = "Profile",
      updateInformation = "Data is successfully Updated",
      noupdateInformation = "Data is not updated",
      ok = "Ok";
  void profilelan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;
      if (b == 1) {
        editProfileInformation = "Редагувати інформацію профілю";
        firstName = "Ім'я";
        lastName = "Прізвище";
        email = "Електронна пошта";
        phoneNumber = "Номер телефону";
        btnSaveChange = "Зберегти зміни";
        profile = "Профіль";
        updateInformation = "Дані успішно оновлюються";
        noupdateInformation = "Дані не оновлюються";
        ok = "Гаразд";
      } else if (b == 2) {
        editProfileInformation = "Edit Profile Information";
        firstName = "First Name";
        lastName = "Last Name";
        email = "Email";
        phoneNumber = "Phone Number";
        btnSaveChange = "Save Changes";
        profile = "Profile";
        updateInformation = "Data is successfully Updated";
        noupdateInformation = "Data is not updated";
        ok = "Ok";
      } else if (b == 3) {
        editProfileInformation = "Изменить информацию профиля";
        firstName = "Имя";
        lastName = "Фамилия";
        email = "Электронное письмо";
        phoneNumber = "Номер телефона";
        btnSaveChange = "Сохранить изменения";
        profile = "Профиль";
        updateInformation = "Данные успешно обновлены";
        noupdateInformation = "Данные не обновляются";
        ok = "Хорошо";
      }
    });
  }

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();

  SharePreferencelogin shPref = SharePreferencelogin();

  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String _currentIds = '';
  String selectedCountryIds= '';
  String firstnameProfile,
      firstnameProfileset,
      lastnameProfile,
      lastnameProfileset,
      pictureProfile,
      pictureProfileset,
      emailProfile,
      emailProfileset,
      phoneProfile,
      phoneProfileset,
      countryidProfile,
      countryidProfileset,
      loginCategory,
      loginCategoryset;

  String imageFile="" ;
  String checkImage="";
  @override
  void initState() {
    profilelan();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');
    _currentIds = countryId.keys
        .firstWhere((k) => countryId[k] == _currentFlag, orElse: () => '');

    profilefirstName();
    profilelastName();
    profileImage();
    profileemail();
    profileNumber();
    profileCountryid();
    loginCategorys();
    checkmobileImage();

    super.initState();
  }

  void profilefirstName() async {
    firstnameProfile = await shPref.getfirstname();
    print("Name is" + firstnameProfile);

    setState(() {
      firstnameProfileset = firstnameProfile;
    });
  }

  void profilelastName() async {
    lastnameProfile = await shPref.getlastname();
    print("Name is" + lastnameProfile);

    setState(() {
      lastnameProfileset = lastnameProfile;
    });
  }

  void profileImage() async {
    pictureProfile = await shPref.getpicture();
    print("Name is" + pictureProfile);
    setState(() {
      if(pictureProfile == "" )
      {
        pictureProfileset ="https://www.pngfind.com/pngs/m/60-600869_logo-person-png-person-logo-transparent-png-download.png";
      }
      else {
        pictureProfileset = pictureProfile;
      }
    });
  }

  void profileemail() async {
    emailProfile = await shPref.getemail();
    print("Name is" + emailProfile);
    setState(() {
      emailProfileset = emailProfile;
    });
  }

  void profileNumber() async {
    phoneProfile = await shPref.getphone();
    print("Name is" + phoneProfile);

    setState(() {
      phoneProfileset = phoneProfile;
    });
  }


  void profileCountryid() async {
    countryidProfile = await shPref.getcountryId();
    print("Name is" +  countryidProfile);

    setState(() {
      countryidProfileset =  countryidProfile;
    });
  }



  void loginCategorys() async {
    loginCategory = await shPref.getloginCategory();
    print("loginCategory" + loginCategory);

    setState(() {
      loginCategoryset = loginCategory;
    });
  }


  void checkmobileImage() async
  {
    checkImage = await shPref.getmobileImage();
    print("Check Image is:"+checkImage);
  }

  void languageChange(BuildContext context,int number)
  {
    shPref.setshared("", "", "", "", "","","","");
    shPref.setmobileImage("");
    shPref.setshared1(number);
    facebookLogins.logOut();
    googleSignins.signOut();
    Navigator.pushReplacementNamed(context, loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GunselScaffold(
        appBarIcon: menuIcon,
        appBarIncluded: true,
        appBarColor: gunselColor,
        appBarTitleIncluded: true,
        appBarTitle: profile,
        drawerIncluded: true,
        backgroundImage: profileScreenBackground,
        bodyWidget: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.0),
            child: Center(
                child: FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Image(
                            image: person,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 1.3,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 1.2 - 46,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 95,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () {
                                        editData();
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return SingleChildScrollView(
                                                  child: Container(
                                                      child: AlertDialog(
                                                          backgroundColor: gunselColor,
                                                          title: Text(
                                                            editProfileInformation,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Helvetica",
                                                                fontSize: 20.0),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                          content: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              Row(children: <Widget>[
                                                                Padding(
                                                                    padding:
                                                                    EdgeInsets.only(
                                                                        top: 15.0),
                                                                    child: Text(
                                                                      firstName,
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.white,
                                                                          fontSize: 10.0,
                                                                          fontFamily:
                                                                          "Helvetica"),
                                                                    )),
                                                                Padding(
                                                                    padding:
                                                                    EdgeInsets.only(
                                                                        top: 15.0,
                                                                        left: 80.0),
                                                                    child: Text(
                                                                      "           $lastName",
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.white,
                                                                          fontSize: 10.0,
                                                                          fontFamily:
                                                                          "Helvetica"),
                                                                    ))
                                                              ]),
                                                              Row(children: <Widget>[
                                                                Expanded(
                                                                    child: TextField(
                                                                      controller:
                                                                      this._firstName,
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      keyboardType:
                                                                      TextInputType.text,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors
                                                                                    .white)),
                                                                        enabledBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors
                                                                                    .white)),
                                                                      ),
                                                                    )),
                                                                SizedBox(
                                                                  width: 5.0,
                                                                ),
                                                                Expanded(
                                                                    child: TextField(
                                                                      controller:
                                                                      this._lastName,
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      keyboardType:
                                                                      TextInputType.text,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors
                                                                                    .white)),
                                                                        enabledBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors
                                                                                    .white)),
                                                                      ),
                                                                    ))
                                                              ]),
                                                              SizedBox(
                                                                height: 5.0,
                                                              ),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: 25.0),
                                                                  child: Text(
                                                                    "$email                                                                                ",
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 10.0,
                                                                        fontFamily:
                                                                        "Helvetica"),
                                                                  )),
                                                              TextField(
                                                                controller: this._email,
                                                                keyboardType: TextInputType
                                                                    .emailAddress,
                                                                style: TextStyle(
                                                                    color: Colors.white),
                                                                decoration: InputDecoration(
                                                                  focusedBorder:
                                                                  UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .white)),
                                                                  enabledBorder:
                                                                  UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .white)),
                                                                ),
                                                              ),
                                                              SizedBox(height: 5.0),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: 170.0),
                                                                  child: Text(phoneNumber,
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.white,
                                                                          fontSize: 10.0,
                                                                          fontFamily:
                                                                          "Helvetica"))),
                                                              Row(
                                                                children: <Widget>[
                                                                  Expanded(
                                                                      flex: 2,
                                                                      child: Container(
                                                                        height: ScreenUtil()
                                                                            .setHeight(50),
                                                                        padding:
                                                                        EdgeInsets.only(
                                                                            left: 5.0),
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              5.0),
                                                                          color:
                                                                          Colors.white,
                                                                        ),
                                                                        child:
                                                                        DropdownButtonHideUnderline(
                                                                            child:
                                                                            DropdownButton(
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .keyboard_arrow_down,
                                                                                color:
                                                                                Colors.grey,
                                                                                size:
                                                                                ScreenUtil(
                                                                                  allowFontScaling:
                                                                                  true,
                                                                                ).setHeight(40),
                                                                              ),
                                                                              elevation: 0,
                                                                              value:
                                                                              _currentFlag,
                                                                              items:
                                                                              _dropDownMenuItems,
                                                                              onChanged:
                                                                              changedDropDownItem,
                                                                            )),
                                                                      )),
                                                                  SizedBox(width: 5.0),
                                                                  Expanded(
                                                                      flex: 5,
                                                                      child: TextField(
                                                                        controller:
                                                                        this._number,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                        keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                        decoration:
                                                                        InputDecoration(
                                                                          focusedBorder: UnderlineInputBorder(
                                                                              borderSide:
                                                                              BorderSide(
                                                                                  color:
                                                                                  Colors.white)),
                                                                          prefix: Text(
                                                                            "$_currentCode",
                                                                            style: TextStyle(
                                                                                color: Colors
                                                                                    .white),
                                                                          ),
                                                                          enabledBorder: UnderlineInputBorder(
                                                                              borderSide:
                                                                              BorderSide(
                                                                                  color:
                                                                                  Colors.white)),
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: 30.0),
                                                                  child: RaisedButton(
                                                                    child: Text(
                                                                      btnSaveChange,
                                                                      style: TextStyle(
                                                                          fontSize: 20.0,
                                                                          color: darkBlue),
                                                                    ),
                                                                    highlightColor:
                                                                    Colors.yellow,
                                                                    color: Colors.yellow,
                                                                    shape:
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.only(
                                                                          bottomRight:
                                                                          Radius.circular(
                                                                              10.0),
                                                                          topLeft: Radius
                                                                              .circular(
                                                                              10.0)),
                                                                    ),
                                                                    onPressed: () {
                                                                      saveChanges();
                                                                    },
                                                                  ))
                                                            ],
                                                          ))));
                                            });
                                      },
                                      child: Image(
                                        image: editProfileIcon,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Text(
                                      firstnameProfileset+" "+lastnameProfileset,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Helvetica"),
                                    )),
                                SizedBox(
                                  height: 3,
                                ),
                                Center(
                                  child: Text(
                                    '$emailProfileset',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Helvetica",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Center(
                                  child: Text(
                                    '$phoneProfileset',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Helvetica",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: (){
                                            languageChange(context,3);
                                          },
                                        child:Column(
                                          children: <Widget>[
                                            Image(
                                              image: profileScreenLanguageIcon,
                                              height: 35,
                                            ),
                                            Text('RU',
                                                style: TextStyle(fontFamily: "Helvetica")),
                                          ],
                                        ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            languageChange(context,1);
                                          },
                                        child:Column(
                                          children: <Widget>[
                                            Image(
                                              image: profileScreenLanguageIcon,
                                              height: 35,
                                            ),
                                            Text('UA',
                                                style: TextStyle(fontFamily: "Helvetica")),
                                          ],
                                        ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            languageChange(context,2);
                                          },
                                        child:Column(
                                          children: <Widget>[
                                            Image(
                                              image: profileScreenLanguageIcon,
                                              height: 35,
                                            ),
                                            Text('EN',
                                                style: TextStyle(fontFamily: "Helvetica")),
                                          ],
                                        ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        //Image Profile ka liya ha ya
                        Container(
//              height: 80.0,
//                width: 80.0,
//                margin: EdgeInsets.only(left: 110.0),
//                decoration: BoxDecoration(shape: BoxShape.circle,
//                image: DecorationImage(
//                  fit: BoxFit.fill,
//                  image: NetworkImage(pictureProfileset)
//                )
//
//                ),
                          child: GestureDetector(
                            onTap: (){
                              _showChoiceDialog(context);
                            },
                            child: _decideImageView(),
                          ),

                        ),

                      ],
                    ),
                  ),
                ))
        ),
      ),
    );





















  }

  List<DropdownMenuItem<AssetImage>> getDropDownMenuItems() {
    List<DropdownMenuItem<AssetImage>> items = new List();
    for (AssetImage flag in countryCode.values) {
      items.add(DropdownMenuItem(
          value: flag,
          child: new Image(
            image: flag,
            height: 20,
          )));
    }
    return items;
  }

  void changedDropDownItem(AssetImage selectedFlag) {
    setState(() {
      _currentFlag = selectedFlag;
      _currentCode = countryCode.keys
          .firstWhere((k) => countryCode[k] == selectedFlag, orElse: () => '');
    });
    _currentIds = countryId.keys
        .firstWhere((j) => countryId[j] == selectedFlag, orElse: () => '');
    this.selectedCountryIds = _currentIds;


//    print("currentcode:"+_currentCode);

  }

  void editData() {
    print(loginCategory);
    if (loginCategory == "facebook") {

      _firstName.text = firstnameProfile;
      _lastName.text = lastnameProfile;
      _email.text = emailProfile;
      _number.text = phoneProfile;

      //print("Country id is:"+countryidProfileset);

    } else if (loginCategory == "custom") {
      print("First Name" + firstnameProfile);
      //print("Last Name" + names[1]);
      _firstName.text = firstnameProfile;
      _lastName.text = lastnameProfile;
      _email.text = emailProfile;
      _number.text = phoneProfile;

      //print("Country id is:"+countryidProfileset);

    } else if (loginCategory == "google") {

      print("First Name" + firstnameProfile);
      //print("Last Name" + names[1]);
      _firstName.text = firstnameProfile;
      _lastName.text = lastnameProfile;
      _email.text = emailProfile;
      _number.text = phoneProfile;

     // print("Country id is:"+countryidProfileset);


//      var names = nameProfile.split(" ");
//      print(names);
//      print("First Name" + names[0]);
//      print("Last Name" + names[1]);
//      _firstName.text = names[0];
//      _lastName.text = names[1];
//      _email.text = emailProfile;
//      _number.text = phoneProfile;
    }
  }

  Future<String> saveChanges() async {
    String editFirstname,editLastname,editCountryid,editPhonenumber,editEmail;

    editFirstname = _firstName.text;
    editLastname = _lastName.text;
    editCountryid = _currentIds.toString();
    editPhonenumber = _number.text;
    editEmail = _email.text;

    print("current id is:"+editCountryid);

//print("Current code is:"+editCountryid);
//print("Current phone is:"+editPhonenumber);

    String tokenData = await shPref.gettokens();
    print(tokenData);

    String url = 'https://test-api.gunsel.ua/Membership.svc/SetMemberInfo';
    Map<String,String> headers = {"token": tokenData};
    String json = '{"FirstName":"$editFirstname","LastName":"$editLastname","CountryId":"$editCountryid","PhoneNumber":"$editPhonenumber","Email":"$editEmail"}';

    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print("Status code is:"+statusCode.toString());
    print("response is"+response.body.toString());

    if(statusCode == 200)
    {
      //String body = response.body;
      print("status code:"+statusCode.toString());


      shPref.setshared(tokenData,editFirstname,editLastname, pictureProfile, editEmail, editPhonenumber,editCountryid, loginCategory);
      profilefirstName();
      profilelastName();
      profileImage();
      profileemail();
      profileNumber();
      loginCategorys();
      //profileCountryid();
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(updateInformation),
              actions: <Widget>[
                FlatButton(
                  child: Text(ok),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });

      //print("Body is:"+body);
    }
    else{
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
              ),
              content: Text(noupdateInformation),
              actions: <Widget>[
                FlatButton(
                  child: Text(ok),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }




//    shPref.setshared(_firstName.text + " " + _lastName.text, pictureProfile,
//        _email.text, _number.text, loginCategory);
//    profileName();
//    profileImage();
//    profileemail();
//    profileNumber();
//    loginCategorys();

  }


  //For imagepicker



  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Make a Choice!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[

              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                  _openGallery(context);
                },
              ),



//              GestureDetector(
//                child: Text('Camera'),
//                onTap: (){
//                 // _openCamera(context);
//                },
//              )

            ],
          ),
        ),
      );
    });
  }












  Widget _decideImageView(){

    if(imageFile=="" && checkImage == ""){
      return Container(
        margin: EdgeInsets.only(left: 110.0,top: 10.0),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.white,width: 2.0),
        ),
        child: ClipOval(
          //child:Image.file(imageFile,width: 160,height: 160,fit: BoxFit.fill,)
          child: Image.network(pictureProfileset,fit: BoxFit.fill,),
//          Image(image: AssetImage("images/salon_employeeimage.jpg"),fit: BoxFit.fill,),
        ),

      );
    }
    else{
      return Container(
        margin: EdgeInsets.only(left: 110.0,top: 10.0),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.white,width: 2.0),
        ),
        child: ClipOval(
            child:Image(image:FileImage(File(checkImage),),fit: BoxFit.fill,)
//          Image(image: AssetImage("images/salon_employeeimage.jpg"),fit: BoxFit.fill,),
        ),

      );
//      return Image.file(imageFile,width: 160,height: 160);
    }
  }



  _openGallery(BuildContext context) async{
    var image= await ImagePicker.pickImage(source: ImageSource.gallery);

    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;
    String fileName = paths.basename(image.path);
    final File localImage = await image.copy('$path/$fileName');
    print("File path is:"+localImage.path);
    print("File is:"+localImage.toString());

    shPref.setmobileImage(localImage.path);


    //print("Picture is"+picture.toString());
    //data
//    var names = nameProfile.split(" ");
//    print(names);
//    print("First Name" + names[0]);
//    print("Last Name" + names[1]);
//    _firstName.text = names[0];
//    _lastName.text = names[1];
//    _email.text = emailProfile;
//    _number.text = phoneProfile;
//    shPref.setshared(_firstName.text + " " + _lastName.text, picture.toString(),
//        _email.text, _number.text, loginCategory);
    //data
    this.setState((){
      checkImage = localImage.path;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async{
//    var picture= await ImagePicker.pickImage(source: ImageSource.camera);
//    this.setState((){
//      imageFile = picture;
//    });

    var image= await ImagePicker.pickImage(source: ImageSource.camera);

    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;
    String fileName = paths.basename(image.path);
    final File localImage = await image.copy('$path/$fileName');
    print("File path is:"+localImage.path);
    print("File is:"+localImage.toString());

    shPref.setmobileImage(localImage.path);

    this.setState((){
      checkImage = localImage.path;
    });


    Navigator.of(context).pop();
  }












}

/*
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: ScreenUtil().setWidth(700),
      height: 550,
      child: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: personImage,
            ),
          ),
          Align(
            alignment:
                Alignment.lerp(Alignment.topCenter, Alignment.center, 0.01),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              child: Image(
                image: profileHolder,
                height: ScreenUtil(
                  allowFontScaling: true,
                ).setSp(130),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setSp(50)),
            height: 60,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image: editProfileIcon,
                height: ScreenUtil().setSp(40),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(210),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Erhan Ozturk',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Helvetica"),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(235),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'eozturk782@gmail.com',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontFamily: "Helvetica",
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(265),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '+380677331606',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontFamily: "Helvetica",
                ),
              ),
            ),
          ),
          SizedBox(
              height: ScreenUtil().setHeight(380),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('RU', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('UA', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('EN', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
 */
