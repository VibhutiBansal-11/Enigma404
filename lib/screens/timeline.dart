import "package:flutter/material.dart";
import 'package:timelines/timelines.dart';
import 'package:provider/provider.dart';
import '../model/reports.dart';
import '../model/report.dart';

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  var _isInit = true;
  var _isLoading = false;
  Future<void> _refreshReports(BuildContext context) async {
    await Provider.of<Reports>(context, listen: false).fetchReport();
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Reports>(context).fetchReport().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final reportdata = Provider.of<Reports>(context);
    final reports = reportdata.items;

    return Scaffold(
        appBar: AppBar(
          title: Text('Timeline'),
        ),
        body: Timeline.tileBuilder(theme: TimelineThemeData(color: Colors.redAccent,connectorTheme: ConnectorThemeData(thickness: 5)),
          builder: TimelineTileBuilder.fromStyle(connectorStyle: ConnectorStyle.solidLine,

            contentsAlign: ContentsAlign.alternating,
            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(height: 70,width: 150,child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(reports[index].date,style: TextStyle(fontWeight: FontWeight.bold),),
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: reports[index].eval1.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                        TextSpan(text: '  ${reports[index].eval1score}',style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: reports[index].eval2.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                        TextSpan(text: '  ${reports[index].eval2score}',style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: reports[index].eval3.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                        TextSpan(text: "  ${reports[index].eval3score}",style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  )

                ],
              ),),
            ),
            itemCount: reports.length,
          ),
        ));
  }
}
