$(document).on('turbolinks:load', function() {
      // Login-Signup buttons container drops from above after a 1sec delay:
  var login_btn_cont_enter_tween = TweenMax.to(".log-sign-btn-cont", 1,
            {'margin-top':'0px', delay:1, ease:Elastic.easeOut.config(0.2, 0.19), paused: true}),
      login_btn_cont_exit_tween = TweenMax.to(".log-sign-btn-cont", 1,
            {'margin-top':'-70px', delay:0.5, ease:Power4.easeOut, paused: true}),

      // Drops forms container from top:
      forms_cont_enter_tween = TweenMax.from(".forms-container", 1,
            {'margin-top':'-200%', ease:Elastic.easeOut.config(0.2, 0.19), paused: true});
      forms_cont_exit_tween = TweenMax.to(".forms-container", 1,
            {'margin-top':'-200%', ease:Power4.easeOut, paused: true});


  // Logo popup
  TweenMax.to("#logo-content", 2.5, { ease: Elastic.easeOut.config(1, 0.3), scale: 1 });
  TweenMax.set(".logo-exit", {y: '0%', delay: 3});

  // Event listener to drop forms container:
  $("[data-activates=forms-container]").click(function(e){
    // e.stopPropagation();
    e.preventDefault();
    // Swtich to Register tab.
    if (this.className == "register-btn") {
      $('#register-tab').trigger('click');
    } else {
      $('#login-tab').trigger('click');
    }

    TweenMax.set(".forms-container", {visibility:'visible'});
    forms_cont_enter_tween.time(0).play();
    login_btn_cont_exit_tween.play().time(0);
  });

  $("[data-activates=forms-exit]").click(function(e){
    e.preventDefault();
    forms_cont_exit_tween.time(0).play();
    login_btn_cont_enter_tween.time(0).play()
  })

  $("[data-activates=logo-exit]").click(function(){
    TweenMax.to("#logo-container", 2, {y: '100%', ease:Expo.easeOut,
    onComplete: function(){
      TweenMax.set("#logo-container", {display: 'none'})
      login_btn_cont_enter_tween.play();
    }});
  })

});
