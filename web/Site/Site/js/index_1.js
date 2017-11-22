$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

$(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});

$(function() {
        // Clear event
    var preview = document.getElementById('imgbtn');
    $('.image-preview-clear').click(function(){
        $('.image-preview-clear').hide();
        $(".image-preview-input-title").text("Browse"); 
        preview.src = "../../Fotos/empty.jpg";
    }); 
    
    $(".imgbtn").on("click", function(e){
        e.preventDefault();
        $(this).parent().find(".input-imagem").trigger("click");
    });
    
});

function previewFile(_this) {
  
  var file    = _this.files[0];
  var reader  = new FileReader();

  reader.onloadend = function () {
    $(_this).parent().find(".imgbtn").get(0).src = reader.result;
        window.console.log($(_this).parent().find(".imgbtn").get(0));
      $(".image-preview-clear").show();
  };

  if (file) {
    reader.readAsDataURL(file);
  } else {
          console.log("TESTE");

  }
}

function clean() {
  var preview = document.getElementById('imgbtn');
  
    preview.src = preview.value.toString();
    
}
