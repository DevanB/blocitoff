$('document').ready(function(){
  $('input[type=checkbox]').change(function(){
    $.ajax({
      url: $(this).data("url"),
      type: "PATCH",
      data: {todo: {"completed": true}}
    })
    $(this).closest(".todo_row").fadeOut();
  });
});