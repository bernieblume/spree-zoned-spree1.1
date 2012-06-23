$(function () {
  if (location.href.match(/\/admin\/products$/))
  {
    if ($("#sel-prd-country").data("prd-country") == 0)
    {
      $("#listing_products").removeClass("sortable");
      $(".handle").hide();
      $(".delfromcountry").hide();
    }
    else
    {
      $("#listing_products").addClass("sortable");
      $("#listing_products").attr("data-sortable-link", "/admin/products/reorder");
      $(".handle").show();
      $(".delfromcountry").show();
    }
  }
});
