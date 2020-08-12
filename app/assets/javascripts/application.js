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

// 画像プレビュー表示
  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img1').change(function(){
        readURL(this);
    });
  });


  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img2').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev3').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img3').change(function(){
        readURL(this);
    });
  });


  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev4').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img4').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev5').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img5').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev6').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img6').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev7').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img7').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev8').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img8').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev9').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img9').change(function(){
        readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev10').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#customer_img10').change(function(){
        readURL(this);
    });
  });

