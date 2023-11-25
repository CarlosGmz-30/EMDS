window.addEventListener("scroll", function() {
    var header = document.getElementById("site-header");
  
    if (window.pageYOffset > 120) {
      header.classList.add("fixed");
    } else {
      header.classList.remove("fixed");
    }
  });
  