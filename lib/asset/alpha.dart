import 'package:flutter/material.dart';

hexstring(String hexcolor) {
  hexcolor = hexcolor.toUpperCase().replaceAll("#", "");
  if (hexcolor.length == 6) {
    hexcolor = "FF$hexcolor";
  }
  return Color(int.parse(hexcolor, radix: 16));
}

Image logowidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextField reuseableTextField(String text, IconData icon, bool isPasswordtype,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordtype,
    enableSuggestions: !isPasswordtype,
    autocorrect: !isPasswordtype,
    cursorColor: Colors.white10,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid))),
    keyboardType: isPasswordtype
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container splashButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        isLogin ? "Log In" : "Sign Up",
      ),
    ),
  );
}
