$(document).on('turbolinks:load', function() {

  // Dashboard
  TweenMax.set("#dashboard", {
    y: -500
  });
  $('[data-activates=dashboard]').click(function(e) {
    e.preventDefault();
    var dashboard = document.getElementById("dashboard");
    if (dashboard.style.display == "none") {
      dashboard.style.display = "block";
      TweenMax.to("#dashboard", 0.5, {
        opacity: 1,
        y: 0,
        ease: Power4.easeOut
      });
      TweenMax.staggerFrom(".dashboard-content", 0.5, {
        opacity: 0,
        x: -20,
        delay: 0.5,
        ease: Bounce.easeOut
      }, 0.2);
    } else {
      dashboardExit();
    }
  })

  $("[data-activates=dashboard-exit]").click(function(){
    dashboardExit();
  })

  // Leaderboard
  //Slide out nav bar
  $("#click-toggle-circle").click(function() {
    //Slide menu out on click
    $("#slide-out").toggle("slide", 600);

    //Close arrow on click
    $("#click-toggle-circle").fadeOut(300);
    $("#click-toggle-arrow").fadeOut(300);

    //Show other arrow on click
    setTimeout(function() {
      $("#slide-down-arrow").fadeIn(800);
      $("#slide-down-circle").fadeIn(800);
    }, 500);

    /* Delay fade in nav items */
    setTimeout(function() {
      $("#slide-out a").fadeIn(800);
    }, 1000);

    return false;
  });


  //Slide out nav bar
  $("#slide-out").click(function() {
    $("#slide-down").toggle("slide", {
      direction: "up"
    }, 200);

    return false;
  });

  //Slide nav bar back in
  $("#slide-down-circle").click(function() {
    //Hide button on click
    $("#slide-down-circle").fadeOut(300);
    $("#slide-down-arrow").fadeOut(300);

    /* Fade out nav items */
    $("#slide-out a").fadeOut(0);


    //Slide nav menu back in
    $("#slide-out").toggle("slide", {
      direction: "left"
    });

    //Reveal nav button again
    $("#click-toggle-arrow").fadeIn(300);
    $("#click-toggle-circle").fadeIn(300);
    return false;
  });

  // Side-nav

  // Temperory fix for position of dropdown.
  $("[data-activates=sidenav-account-dropdown]").click(function(){
    TweenMax.set("#sidenav-account-dropdown", {delay: 0.01, left: 'auto'})
  })

  $("[data-activates=side-nav]").click(function(){
    var sidenav = document.getElementById("side-nav");
    if (sidenav.style.display == 'none') {
      sidenav.style.display = 'block';
      TweenMax.to("#side-nav", 0.5, {x: '0%', ease:Power4.easeOut});
    } else {
      TweenMax.to("#side-nav", 0.5, {x:'100%', ease:Power4.easeOut,
        onComplete: function(){
          sidenav.style.display = 'none';
        }});
    }
  })

});

function dashboardExit(){
  TweenMax.to(".dashboard-content", 0.5, {
    x: -20,
    ease: Power4.easeOut
  }, 0.2);
  TweenMax.to("#dashboard", 0.5, {
    opacity: 0,
    y: -500,
    onComplete: function() {
      dashboard.style.display = "none";
      TweenMax.set(".dashboard-content", {
        x: 0
      });
    }
  });
}
