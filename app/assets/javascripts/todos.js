$('document').ready(function(){
  $('input[type=checkbox]').change(function(){
    $.ajax({
      url: $(this).data("url"),
      type: "PATCH",
      data: {todo: {"completed": true}},
      success: function(e) {
        $('p.notice').html(e);
      }
    })
    $(this).closest(".todo_row").fadeOut();
  });
});