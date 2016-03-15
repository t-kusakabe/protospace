// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require jquery.infinitescroll
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

// populars/index.html.haml
$(function(){
    $(document).on('mouseenter', '.thumbnail', function() {
        $(this).find('.operation_list').css('display', 'block');
    });
    $(document).on('mouseleave', '.thumbnail', function(){
        $('.operation_list').css('display', 'none');
    });
});

// 画像upload時に表示
 var openFile = function(event, select) {
   var input = event.target;

   var reader = new FileReader();
   reader.onload = function(){
     var dataURL = reader.result;
     if(select == 'main'){
       var output = document.getElementById('main_thumbnail');
     }else if(select == 'sub_thumbnail1'){
       var output = document.getElementById('sub_thumbnail1');
     }else if(select == 'sub_thumbnail2'){
       var output = document.getElementById('sub_thumbnail2');
     }else {
       var output = document.getElementById('user_thumbnail');
     }
     output.src = dataURL;
   };
   reader.readAsDataURL(input.files[0]);
 };
