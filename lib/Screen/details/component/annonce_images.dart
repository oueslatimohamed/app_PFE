import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class AnnonceImages extends StatefulWidget {
  const AnnonceImages({
    this.annonce,
  });

  final Annonce annonce;
  @override
  _AnnonceImagesState createState() => _AnnonceImagesState();
}

class _AnnonceImagesState extends State<AnnonceImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
              height: 300,
              child: Image.network(widget.annonce.images[selectedImage],fit: BoxFit.cover,),
          ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.annonce.images.length,
                    (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(2),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: primaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(widget.annonce.images[index],fit: BoxFit.cover,),
      ),
    );
  }
}
