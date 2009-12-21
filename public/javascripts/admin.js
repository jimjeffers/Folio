$(document).ready(function() {
   // Add list sorting for admin.
   $(".sorted_list").sortable({
      update: function(event, ui) {
         var list = $(this);
         list.css("opacity",0.25);
         var current = $(event.target);
         $.post('/'+current.attr('id')+'/sort', current.sortable('serialize'),
            function(data) {
               alert(data);
               list.css("opacity",1);
            },
         "text");
      }
   });
   $(".sorted_list").disableSelection();
});
