document.getElementById('insert').addEventListener("click", function(){  
   var data = {
    service_id: 'gmail',
    template_id: 'template_vNFyYhqW',
    user_id: 'user_InDnzbGp0eCqm9tRk78cx',
    template_params: {
        'username': 'James',
    } 
};
 
$.ajax('https://api.emailjs.com/api/v1.0/email/send', {
    type: 'POST',
    data: JSON.stringify(data),
    contentType: 'application/json'
}).done(function() {
    alert('Your mail is sent!');
}).fail(function(error) {
    alert('Oops... ' + JSON.stringify(error));
});
  
}); 

$("document").ready(function(){
    setTimeout(function(){
        $("#message").remove();
    }, 10000 );
});