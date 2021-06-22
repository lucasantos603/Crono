import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/views/initial/ajuda_page.dart';
import 'package:CRONO/views/initial/privacidade_page.dart';

class FooterWidget extends StatefulWidget {
  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  void _openAjudaPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AjudaPage()),
    );
  }

  void _openPrivacidadePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PrivacidadePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Text(
              "Ajuda",
              style: AppTextStyles.footer,
            ),
            onTap: () => _openAjudaPage(),
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text(
              "Termos de uso",
              style: AppTextStyles.footer,
            ),
            onTap: () => _openPrivacidadePage(),
          ),
        ],
      ),
    );
  }
}
