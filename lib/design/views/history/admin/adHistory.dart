import 'package:customer/design/views/history/admin/adHistory_view_model.dart';
import 'package:customer/design/widgets/history_list.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AdHistory extends StatelessWidget {
  const AdHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdHistoryViewModel>.nonReactive(
        onModelReady: (model) => model.listenToFuels(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: kcbackgroudColor,
              title: Text(
                model.title,
                style: ktsBigWhite,
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kcdeepGreen,
                ),
                onPressed: () {
                  model.navBack();
                },
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: kcbackgroudColor,
              child: model.fuels == null
                  ? Center(
                      child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  // Theme.of(context).primaryColor
                                  Colors.white),
                            ))
                  : ListView.builder(
                      itemCount: model.fuels.length,
                      itemBuilder: (context, index) => FuelItem(
                            fuel: model.fuels[index], model: model
                          )),
            )),
        viewModelBuilder: () => AdHistoryViewModel());
  }
}
