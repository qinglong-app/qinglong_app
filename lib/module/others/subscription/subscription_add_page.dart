import 'package:flutter/material.dart';
import 'package:qinglong_app/base/http/api.dart';
import 'package:qinglong_app/base/ql_app_bar.dart';
import 'package:qinglong_app/module/others/subscription/subscription_bean.dart';
import 'package:qinglong_app/utils/extension.dart';

class SubscriptionAddPage extends StatefulWidget {
  final Subscription? bean;

  const SubscriptionAddPage(this.bean, {Key? key}) : super(key: key);

  @override
  State<SubscriptionAddPage> createState() => _SubscriptionAddPageState();
}

class _SubscriptionAddPageState extends State<SubscriptionAddPage> {
  late Subscription _bean;

  late String? _scheduleType;
  late String? _type;

  late String? _intervalScheduleType;
  late String? _intervalScheduleValue;


  @override
  void initState() {
    super.initState();
    if (widget.bean == null) {
      _bean = Subscription();
      _bean.scheduleType = "";
      _type = "public-repo";
      _scheduleType = "crontab";

      _intervalScheduleType = "days";
    } else {
      _bean = widget.bean!;
      _type = widget.bean?.type;
      _scheduleType = widget.bean?.scheduleType;
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _intervalScheduleValueController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  final TextEditingController _whiteListController = TextEditingController();
  final TextEditingController _blackListController = TextEditingController();
  final TextEditingController _dependenceController = TextEditingController();
  final TextEditingController _extensionsController = TextEditingController();
  final TextEditingController _taskBeforeController = TextEditingController();
  final TextEditingController _taskAfterController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QlAppBar(
        canBack: true,
        backCall: () {
          Navigator.of(context).pop();
        },
        title: _bean.name == null ? "????????????" : "????????????",
        actions: [
          InkWell(
            onTap: () {
              submit(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Center(
                child: Text(
                  "??????",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "??????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    focusNode: focusNode,
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "???????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "??????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "public-repo",
                              groupValue: _type,
                              onChanged: (data) {
                                setState(() {
                                  _type = data as String?;
                                });
                              }),
                          const Text("????????????"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "private-repo",
                              groupValue: _type,
                              onChanged: (data) {
                                setState(() {
                                  _type = data as String?;
                                });
                              }),
                          const Text("????????????"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "file",
                              groupValue: _type,
                              onChanged: (data) {
                                setState(() {
                                  _type = data as String?;
                                });
                              }),
                          const Text("?????????"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "??????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _urlController,
                    maxLines: 8,
                    minLines: 1,
                    decoration: const InputDecoration(
                      hintText: "?????????????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "??????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _branchController,
                    decoration: const InputDecoration(
                      hintText: "???????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "????????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "crontab",
                              groupValue: _scheduleType,
                              onChanged: (data) {
                                setState(() {
                                  _scheduleType = data as String?;
                                });
                              }),
                          const Text("crontab"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "interval",
                              groupValue: _scheduleType,
                              onChanged: (data) {
                                setState(() {
                                  _scheduleType = data as String?;
                                });
                              }),
                          const Text("interval"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "????????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  getScheduler(context)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "?????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _whiteListController,
                    decoration: const InputDecoration(
                      hintText: "??????????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "?????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _blackListController,
                    decoration: const InputDecoration(
                      hintText: "??????????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "????????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _dependenceController,
                    decoration: const InputDecoration(
                      hintText: "?????????????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "????????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _extensionsController,
                    decoration: const InputDecoration(
                      hintText: "?????????????????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "?????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _taskBeforeController,
                    decoration: const InputDecoration(
                      hintText: "?????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "?????????:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _taskAfterController,
                    decoration: const InputDecoration(
                      hintText: "?????????",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getScheduler(BuildContext context) {
    if (_scheduleType == "crontab") {
      return  TextField(
        controller: _scheduleController,
        decoration: const InputDecoration(
          hintText: "??????????????? ??? ??? ??? ??? ???",
        ),
        autofocus: false,
      );
    } else {
      return Row(
        children: [
          const Text("???"),
           SizedBox(
            width: 350,
            child: TextField(
              controller: _intervalScheduleValueController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "",
              ),
              autofocus: false,
            ),
          ),

          DropdownButton<String>(
            underline: Container(height: 0),
            value: _intervalScheduleType,
              items: const [
                DropdownMenuItem(child: Text("???"),value: "hours",),
                DropdownMenuItem(child: Text("???"),value: "days",),
                DropdownMenuItem(child: Text("???"),value: "weeks",),
              ],
              onChanged: (data) {setState(() {
                _intervalScheduleType = data;
              });})
        ],
      );
    }
  }

  void submit(BuildContext context) async {
    if (_nameController.text.isEmpty){
      "??????????????????".toast();
      return;
    }else{
      _bean.name = _nameController.value.text;
    }
    if (_urlController.text.isEmpty){
      "??????????????????".toast();
      return;
    }else{
      _bean.url = _urlController.value.text;
    }

    _bean.type = _type;
    _bean.branch = _branchController.value.text;
    if (_scheduleType != null && _scheduleType == "crontab"){
      if (_scheduleController.text.isEmpty){
        "????????????????????????".toast();
        return;
      }else{
        _bean.schedule = _scheduleController.value.text;
      }
    }else{
      if (_intervalScheduleValueController.text.isEmpty){
        "????????????????????????".toast();
        return;
      }else{
        var inter = IntervalSchedule();
        inter.type = _intervalScheduleType;
        inter.value = int.tryParse(_intervalScheduleValueController.value.text);
        _bean.intervalSchedule = inter;
      }
    }
    _bean.alias = _bean.name;
    _bean.scheduleType = _scheduleType;
    _bean.whitelist = _whiteListController.value.text;
    _bean.blacklist = _blackListController.value.text;
    _bean.extensions = _extensionsController.value.text;
    _bean.dependences = _dependenceController.value.text;
    _bean.subBefore = _taskBeforeController.value.text;
    _bean.subAfter = _taskAfterController.value.text;
    var data = await Api.postSubscription(_bean);
    if (!data.success){
      data.message.toast();
    }else{
      "????????????".toast();
      Navigator.of(context).pop();
    }
  }
}
