import 'project_obj.dart';

class ProjectsBrain {
  List<Project> projectsBank = [
    Project(
        heading: "NAATI Sinhalese",
        disc:
            "An app that helps students excel at the NAATI Sinhalese interpretation exam by providing all study essentials in one location. Pass the NAATI CCL Sinhalese Exam on the first go.",
        imagePath: 'assets/images/naati.png',
        tools: ["Flutter", "Flutter"],
        appStore:
            "https://apps.apple.com/au/app/naati-sinhalese/id1556150777#?platform=iphone",
        playStore:
            "https://play.google.com/store/apps/details?id=com.akmilabs.naatisinhala",
        website: "https://naatisinhala.com.au/"),
    Project(
        heading: "Quick Notes",
        disc:
            "Quick Notes is a simple and elegant app that brings all your notes into one place. The app boasts a clean and modern user interface that can be used intuitively.",
        imagePath: 'assets/images/quicknotes.png',
        tools: ["Flutter"],
        website: null,
        appStore: null,
        playStore:
            "https://play.google.com/store/apps/details?id=com.jayanandharithwick.simple_notes&hl=en_US&gl=US"),
  ];
}
