// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"
import '../stylesheets/application.scss'
import './bootstrap_custom.js'
import sortable from 'html5sortable/dist/html5sortable.es.js'
import Rails from '@rails/ujs'


$(document).on('turbolinks:load', function() {
  sortable('#spans', {
    items: '.task'
  });
  
  if (typeof sortable('#spans')[0] != 'undefined'){
    sortable('#spans')[0].addEventListener('sortupdate', function(e) {
      var dataIDList = $(this).children().map(function(index){
        return "span[]=" + $(this).data("id");
      }).get().join("&");
      Rails.ajax({
          url: $(this).data("url"),
          type: "PATCH",
          data: dataIDList,
        });
    });
  }

  $('button#back').on('click', function(e){
      e.preventDefault();
      window.history.back();
  });
})
