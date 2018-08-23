import "bootstrap";
import { chefShowTabs } from "../chefs/chef-tabs.js";
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';

$(document).ready(function(){
  $('.owl-carousel').owlCarousel({
      loop:true,
      margin:10,
      nav:true,
      navText : ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"]
  });
});

chefShowTabs();
