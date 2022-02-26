/*import 'package:flutter/material.dart';

class Components extends StatelessWidget {
  const Components({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container();
  }
  DropDown(List<String> items, String value,void onChange(val)){
    return Container(
      child: DropButton<String>(
        value: value,
        onChanged: (String val){
          onChange(val);
        }
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';

Widget DropDown(List<String> items, String value,void onChange(val)){
  return Container(
    child: DropButton<String>(
        value: value,
        onChanged: (String val){
          onChange(val);
        },
      items: items.map<DropDownMenu<Sttring>>(
          (String val){
            return DropDownMenu(child: Text("val"));
          }
      )
    ),
  );
}
*/
import 'package:flutter/material.dart';

Widget customDropDown(List<String> items, String value, void onChange(val)){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (var val){
        onChange(val);
      },
      items: items?.map((String val) {
        return DropdownMenuItem<String>(
          child: Text(val),
          value:val,);

      })?.toList() ?? [],
    ),
  );


}