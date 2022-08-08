$(document).ready(function () {
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // Select/Deselect checkboxes
    var checkbox = $('table tbody input[type="checkbox"]');
    $("#selectAll").click(function () {
        if (this.checked) {
            checkbox.each(function () {
                this.checked = true;
            });
        } else {
            checkbox.each(function () {
                this.checked = false;
            });
        }
    });
    checkbox.click(function () {
        if (!this.checked) {
            $("#selectAll").prop("checked", false);
        }
    });
});


$(".dropdown-toggle").on("mouseenter mouseleave", function(e){
   
   // só irá usar os eventos se o menu hamburguer estiver oculto
   if(!$(".navbar-toggle").is(":visible")){
      if(e.type == "mouseenter"){
         $(this)
         .attr("aria-expanded", "true")
         .closest(".dropdown")
         .addClass("open"); // adiciona a classe que abre o menu
      }
      if(e.type == "mouseleave"){
         var $t = $(this);
         setTimeout(function(){ // este pequeno delay é para não piscar
            $t
            .attr("aria-expanded", "false")
            .closest(".dropdown")
            .removeClass("open"); // remove a classe que abre o menu
         }, 100);
      }
   }
});

// se sair do menu, dispara o click no botão e esconde
$(".dropdown-menu").on("mouseleave", function(){
   if(!$(".navbar-toggle").is(":visible")){
      $(this)
      .closest(".dropdown")
      .find(".dropdown-toggle")
      .trigger("click");
   }
});

$('#cbxShow').click(function(){
this.checked?$('#block').show():$('#block').hide(); //time for show
});

$('#cbxHide').click(function(){
this.checked?$('#block').hide():$('#block').hide();
});

