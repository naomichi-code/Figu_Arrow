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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .

//アップロード時のプレビュー表示
$(document).on('turbolinks:load', function() {
    $(function() {
        // jQuery Upload Thumbs
        $('form input:file').uploadThumbs({
            position : 0,      // 0:before, 1:after, 2:parent.prepend, 3:parent.append,
                            // any: arbitrarily jquery selector
            imgbreak : true    // append <br> after thumbnail images
        });
    });
});