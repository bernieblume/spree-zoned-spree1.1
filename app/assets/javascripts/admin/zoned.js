$(function () {
  if ($("#sel-prd-country").data("prd-country") == 0)
  {
    $(".handle").hide();
    $(".delfromcountry").hide();
  }
  else
  {
    $(".handle").show();
    $(".delfromcountry").show();
  }  
});
