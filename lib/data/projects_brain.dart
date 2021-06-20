import 'project_obj.dart';
import 'package:flutter/material.dart';

class ProjectsBrain {
  List<Project> projectsBank = [
    Project(
        heading: "Rinkeby Faucet",
        disc: "A faucet to request Eth for development in the Rinkeby Network",
        imagePath: 'assets/images/eth.png',
        tools: [
          ["React", Colors.red],
          ["Web3", Colors.blueAccent],
          ["Solidity", Colors.greenAccent],
        ],
        appStore: null,
        playStore: null,
        website: null,
        comingSoon: true),
    Project(
        heading: "Snapps Bookmark Manager",
        disc:
            "I constantly bookmark websites and find myself struggling to keep them organised. I made Snapps that turns your Chrome New Tab into an ultimate bookmark manager. Simple, light weight and easy to use bookmark manager.",
        imagePath: 'assets/images/snapps.png',
        tools: [
          ["React", Colors.red],
        ],
        appStore: null,
        playStore: null,
        website: null,
        comingSoon: true),
    Project(
        heading: "NAATI Sinhalese",
        disc:
            "An app that helps students excel at the NAATI Sinhalese interpretation exam by providing all study essentials in one location. Pass the NAATI CCL Sinhalese Exam on the first go.",
        imagePath: 'assets/images/naati.png',
        tools: [
          ["Flutter", Colors.blue],
          ["Firebase", Colors.orange],
          ["Wordpress", Colors.purple],
        ],
        appStore:
            "https://apps.apple.com/au/app/naati-sinhalese/id1556150777#?platform=iphone",
        playStore:
            "https://play.google.com/store/apps/details?id=com.akmilabs.naatisinhala",
        website: "https://naatisinhala.com.au/",
        comingSoon: false),
    Project(
        heading: "Fishing Health Tech",
        disc:
            "An E-Learning Platform and ERP system for limited resource environments. The app won the 2020 Engineering World Health design competition.",
        imagePath: 'assets/images/ewh.png',
        tools: [
          ["React", Colors.red],
          ["AWS", Colors.blueGrey],
        ],
        appStore: null,
        playStore: null,
        website:
            "https://www.auckland.ac.nz/en/news/2020/09/20/app--for-healthcare-workers-in-uganda-wins-award.html",
        comingSoon: false),
    Project(
        heading: "Quick Notes",
        disc:
            "Quick Notes is a simple and elegant app that brings all your notes into one place. The app boasts a clean and modern user interface that can be used intuitively.",
        imagePath: 'assets/images/quicknotes.png',
        tools: [
          ["Flutter", Colors.blue]
        ],
        website: null,
        appStore: null,
        playStore:
            "https://play.google.com/store/apps/details?id=com.jayanandharithwick.simple_notes&hl=en_US&gl=US",
        comingSoon: false),
  ];
}
