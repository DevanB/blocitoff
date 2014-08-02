$('document').ready(function(){
  $('input[type=checkbox]').change(function(){
    console.log("click");
    console.log($(this).data("url"));
    $.ajax({url: $(this).data("url"), type: "PATCH", data: {todo: {"completed": true}}})
  });
});