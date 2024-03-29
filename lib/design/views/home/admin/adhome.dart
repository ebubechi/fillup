import 'package:customer/design/views/home/admin/adhome_view_model.dart';
// import 'package:customer/design/views/home/home_view_model.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'adhome.form.dart';

@FormView(fields: [
  FormTextField(name: 'amountPerLitre'),
])
class AdHome extends StatelessWidget with $AdHomeView {
  AdHome({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdHomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kcdeepBlack,
              elevation: 0.0,
              leading: IconButton(
                  icon: Icon(
                    Icons.notes,
                    color: kcdeepGreen,
                  ),
                  onPressed: () {
                    // TODO: openDrawer
                    _scaffoldKey.currentState!.openDrawer();
                  }),
            ),
            backgroundColor: kcdeepBlack,
            drawer: Theme(
                data: Theme.of(context).copyWith(canvasColor: kcdeepBlack),
                child: FutureBuilder(
                    future: model.currentUserEmail(),
                    builder: (context, snapshot) {
                      return _drawer(context, model, snapshot);
                    })),
            body: ListView(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              model.title,
                              style: ktsBigWhite,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 300,
                              height: 150,
                              decoration: new BoxDecoration(
                                  color: kclightGreen,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          'Amount',
                                          style: ktsMediumBlack,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 90.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 35.0, left: 20.0),
                                          child: TextField(
                                            style: ktsBigGreen,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: InputDecoration(
                                                hintText: '0.0',
                                                border: InputBorder.none,
                                                hintStyle: ktsBigGreen),
                                            controller:
                                                amountPerLitreController,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child:
                                            Text('NGN', style: ktsMediumGreen),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, right: 30.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                // model.printt();
                                model.updateFuelPrice(
                                  amountPerLitre: double.parse(
                                      amountPerLitreController.text),
                                );
                              },
                              child: Text(
                                'Update Price',
                                style: ktsBigBlack,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: kcdeepGreen,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ],
            )),
        viewModelBuilder: () => AdHomeViewModel());
  }

  Widget _drawer(context, AdHomeViewModel model, AsyncSnapshot snapshot) {
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: ktsBigGreen,
                ),
                Text(
                  snapshot.data.toString(),
                  style: ktsMediumWhite,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(color: kcdeepBlack)),
      Column(
        children: [
          Divider(
            thickness: 5.0,
            height: 5.0,
            color: kcdeepGreen,
          ),
          ListTile(
            title: Text(
              'Home',
              style: ktsMediumWhite,
            ),
            onTap: () {
              model.navToHome();
            },
          ),
          Divider(
            color: kcdeepGreen,
          ),
          ListTile(
            title: Text(
              'Sales',
              style: ktsMediumWhite,
            ),
            onTap: () {
              model.navToHistory();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 120.0),
            child: Divider(
              color: kcdeepGreen,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListTile(
              title: Text(
                'Logout',
                style: ktsMediumWhite,
              ),
              onTap: () {
                model.logout();
              },
            ),
          ),
        ],
      ),
    ]));
  }
}
