import 'package:minimal_portfolio_webapp/data/blog_obj.dart';

import 'blog_obj.dart';

class BlogBrain {
  List<BlogPosts> blogBank = [
    BlogPosts(
        title: "What is WEI in the Ethereum Blockchain?",
        image: "images/blog/wei.jpg",
        tags: ["Ethereum", "Blockchain"],
        date: "June 23rd 2021",
        link:
            "https://harithwick.medium.com/secure-access-service-edge-sase-the-vpn-2-0-2ecdc29bc334"),
    BlogPosts(
        title:
            "How to launch a WordPress website on Amazon Web Services (AWS) using AWS LightSail",
        image: "images/blog/aws_wordpress.png",
        tags: ["AWS", "Wordpress"],
        date: "June 23rd 2021",
        link:
            "https://harithwick.medium.com/how-to-launch-a-wordpress-website-on-amazon-web-services-aws-using-aws-lightsail-490ba27c3b12"),
    BlogPosts(
        title: "Secure Access Service Edge (SASE), the VPN 2.0",
        image: "images/blog/sase.png",
        tags: ["VPN", "SASE", "Cloud Security"],
        date: "June 23rd 2021",
        link:
            "https://harithwick.medium.com/what-is-wei-ethereum-e45cf579081b"),
  ];
}
