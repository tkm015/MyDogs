// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap

// cover_imageプレビュー表示
$(function() {
 function readURL(input) {
   if (input.files && input.files[0]) {
     const reader = new FileReader();
     reader.onload = function (e) {
       $('.cover_image_prev').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
   }
 }
 $(".cover_image").change(function(){
   readURL(this);
 });
});

// profile_imageプレビュー表示
$(function() {
 function readURL(input) {
   if (input.files && input.files[0]) {
     const reader = new FileReader();
     reader.onload = function (e) {
       $('.profile_image_prev').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
   }
 }
 $(".profile_image").change(function(){
   readURL(this);
 });
});