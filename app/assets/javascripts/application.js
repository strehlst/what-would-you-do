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
//= require turbolinks
//= require jquery3
//= require jquery.raty-fa.js
//= require_tree .
//= require popper
//= require bootstrap
$(document).on('turbolinks:load', function(){
    $('.rating').raty({
        mouseover: function() {
          var amount = $((this)).find('i.on').last().attr('data-score');
          if (amount == undefined)
            amount = 0;
          $('#amount .result.selected .value').text(amount*100);
            $((this)).find('i.on').last().attr('data-score');
        },
        click: function() {
            var amount = $((this)).find('i.on').last().attr('data-score');
            if (amount == undefined)
                amount = 0;
            $('#amount .result.chosen .value').text(amount*100);
        },
        mouseout: function() {
          var amount = $((this)).find('i.on').last().attr('data-score');
          if (amount == undefined)
              amount = 0;
          $('#amount .result.chosen .value').text(amount*100);
          $('#amount .result.selected .value').text(0);
        },
        scoreName: 'response[rating]',
        number: 12,
        starOn:    'fa fa-circle on',
        starOff:    'far fa-circle',
        hints: [null, null, null, null, null, null, null, null, null, null, null, null, ]
    });
});
