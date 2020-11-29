import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool isSubmitting = false;
  final _scafKey = GlobalKey<ScaffoldState>();
  String _address, code, company, email, message, name, phone;
  final snackBar = SnackBar(content: Text('Form Submitted'));
  final _formKey = GlobalKey<FormState>();
  _submit() async {
    _formKey.currentState.save();
    setState(() {
      isSubmitting = true;
    });
    await _submitData();
    setState(() {
      isSubmitting = false;
    });
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: Text("Form Submitted"),
            content: Text("Form is Submitted. Thank you..!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _formKey.currentState.reset();

                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                "Submit your Query",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: (val) =>
                          val.length < 2 ? 'Invalid Name' : null,
                      onSaved: (val) => name = val,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (val) =>
                          val.length < 2 ? 'Invalid Email' : null,
                      onSaved: (val) => email = val,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: (val) =>
                          val.length < 2 ? 'Invalid address' : null,
                      onSaved: (val) => _address = val,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Address",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (val) =>
                          val.length < 2 ? 'Invalid Number' : null,
                      onSaved: (val) => phone = val,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Contact no.",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      onSaved: (val) => code = val,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Item Code (Optional)",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onSaved: (val) => company = val,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Company Name (Optional)",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      validator: (val) =>
                          val.length < 2 ? 'Please write your query' : null,
                      onSaved: (val) => message = val,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: "Message",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    isSubmitting == true
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.black),
                          )
                        : Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.lightBlueAccent,
                              color: Colors.black,
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    _submit();
                                  } else {
                                    print('error');
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    // SizedBox(
                    //   height: 100,
                    //   width: MediaQuery.of(context).size.width - 100,
                    //   child: Image.asset(
                    //     "assets/logo.png",
                    //   ),
                    // ),
                    SizedBox(height: 15.0),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  _submitData() async {
    await Firestore.instance.collection('ContactForm').document().setData({
      'Name': name ?? '',
      'Address': _address ?? '',
      'Code': code ?? '',
      'Company': company ?? '',
      'Email': email ?? '',
      'Message': message ?? '',
      'Phone': phone ?? '',
      'Date': DateTime.now()
    });
    return true;
  }
}
