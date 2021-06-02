import 'package:flutter/material.dart';
import 'package:talebcom_app/models/annonce.dart';
import 'package:talebcom_app/models/categories.dart';
import 'package:talebcom_app/models/user.dart';

const primaryColor = Color(0xFFFF422D);
const secondColor = Color(0xFF707070);
const theredColor = Color(0xFF2B2E4A);
const fourColor = Color(0xFFFFECEA);
const selectColor = Color(0xFFFFD9D5);

const String API_KEY = "AIzaSyCla5R1jGmVVbZcOY4Yl9HhKXj0mQFucxE";

List<Map<String, dynamic>> categories = [
  {"text": "Tous"},
  {"text": "Location"},
  {"text": "Colocation"},
  {"text": "Covoiturage"},
  {"text": "Récup"},
];
List<Map<String, dynamic>> categoriess = [
  {"text": "Location"},
  {"text": "Colocation"},
  {"text": "Covoiturage"},
  {"text": "Récup"},
];

List<Annonce> annonces_static = [
  Annonce(
      id: 1,
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png"
      ],
      title: "GAOMON M106K-10 x 6 Pouces Tablette Graphique Professionnelle avec Stylet et 12 Raccourcis Dessin Numérique",
      description: "12 Boutons de Programmation & Stylet Bague--Il y a 12 touches express sur le côté gauche et 16 touches de fonction sur le dessus de la tablette, qui peuvent être personnalisées que vous les souhaitez, pour rendre les opérations plus efficacies. Une stylet bague sur le côté droit de M106K. Il est pratique pour vous pour porter le stylo avec la tablette graphique, et éviter de le perdre lorsque le stylo est pas utilisé.",
      price: 120.0,
      adresse: "Tunis , Tunisia",
      user: User(name: "Mohamed",lastname: "OUESLATI"),
      category: Category(image:"assets/images/heart.svg",name: "Recup")
  ),
  Annonce(
      id: 2,
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png"
      ],
      title: "GAOMON M106K-10 x 6 Pouces Tablette Graphique Professionnelle avec Stylet et 12 Raccourcis Dessin Numérique",
      description: "12 Boutons de Programmation & Stylet Bague--Il y a 12 touches express sur le côté gauche et 16 touches de fonction sur le dessus de la tablette, qui peuvent être personnalisées que vous les souhaitez, pour rendre les opérations plus efficacies. Une stylet bague sur le côté droit de M106K. Il est pratique pour vous pour porter le stylo avec la tablette graphique, et éviter de le perdre lorsque le stylo est pas utilisé.",
      price: 120.0,
      adresse: "Tunis , Tunisia",
      user: User(name: "Mohamed",lastname: "OUESLATI"),
      category: Category(image:"assets/images/heart.svg",name: "recup")
  ),
  Annonce(
      id: 3,
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png"
      ],
      title: "GAOMON M106K-10 x 6 Pouces Tablette Graphique Professionnelle avec Stylet et 12 Raccourcis Dessin Numérique",
      description: "12 Boutons de Programmation & Stylet Bague--Il y a 12 touches express sur le côté gauche et 16 touches de fonction sur le dessus de la tablette, qui peuvent être personnalisées que vous les souhaitez, pour rendre les opérations plus efficacies. Une stylet bague sur le côté droit de M106K. Il est pratique pour vous pour porter le stylo avec la tablette graphique, et éviter de le perdre lorsque le stylo est pas utilisé.",
      price: 120.0,
      adresse: "Tunis , Tunisia",
      user: User(name: "Mohamed",lastname: "OUESLATI"),
      category: Category(image:"assets/images/4.png",name: "recup")
  ),
  Annonce(
      id: 4,
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png"
      ],
      title: "GAOMON M106K-10 x 6 Pouces Tablette Graphique Professionnelle avec Stylet et 12 Raccourcis Dessin Numérique",
      description: "12 Boutons de Programmation & Stylet Bague--Il y a 12 touches express sur le côté gauche et 16 touches de fonction sur le dessus de la tablette, qui peuvent être personnalisées que vous les souhaitez, pour rendre les opérations plus efficacies. Une stylet bague sur le côté droit de M106K. Il est pratique pour vous pour porter le stylo avec la tablette graphique, et éviter de le perdre lorsque le stylo est pas utilisé.",
      price: 120.0,
      adresse: "Tunis , Tunisia",
      user: User(name: "Mohamed",lastname: "OUESLATI"),
      category: Category(image:"assets/images/heart.svg",name: "recup")
  ),
  Annonce(
      id: 5,
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png"
      ],
      title: "GAOMON M106K-10 x 6 Pouces Tablette Graphique Professionnelle avec Stylet et 12 Raccourcis Dessin Numérique",
      description: "12 Boutons de Programmation & Stylet Bague--Il y a 12 touches express sur le côté gauche et 16 touches de fonction sur le dessus de la tablette, qui peuvent être personnalisées que vous les souhaitez, pour rendre les opérations plus efficacies. Une stylet bague sur le côté droit de M106K. Il est pratique pour vous pour porter le stylo avec la tablette graphique, et éviter de le perdre lorsque le stylo est pas utilisé.",
      price: 120.0,
      adresse: "Tunis , Tunisia",
      user: User(name: "Mohamed",lastname: "OUESLATI"),
      category: Category(image:"assets/images/heart.svg",name: "recup")
  ),
  Annonce(
      id: 6,
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png"
      ],
      title: "GAOMON M106K-10 x 6 Pouces Tablette Graphique Professionnelle avec Stylet et 12 Raccourcis Dessin Numérique",
      description: "12 Boutons de Programmation & Stylet Bague--Il y a 12 touches express sur le côté gauche et 16 touches de fonction sur le dessus de la tablette, qui peuvent être personnalisées que vous les souhaitez, pour rendre les opérations plus efficacies. Une stylet bague sur le côté droit de M106K. Il est pratique pour vous pour porter le stylo avec la tablette graphique, et éviter de le perdre lorsque le stylo est pas utilisé.",
      price: 120.0,
      adresse: "Tunis , Tunisia",
      user: User(name: "Mohamed",lastname: "OUESLATI"),
      category: Category(image:"assets/images/4.png",name: "recup")
  )
];