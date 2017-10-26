// $(document).ready(function() {
//   $("#new_account_type").click(function(){
//     window.alert("Hello");
//   });
// });

$(document).on('turbolinks:load', function() {
  $("#minimum_payment, #due_date, #date_label, #balance, #credit_limit").hide();
  // $("#credit_limit").hide();
  // $("#due_date").hide();
  // $("#balance").hide();
  $("#account_type").change(function(){
    var type = $(this).find("option:selected").attr('id');
    // window.alert("Account type is: " + type + "!");
    
    if(type == "bank" || type == "cash") {
      $("#balance").show();
      $("#credit_limit, #due_date, #date_label, #minimum_payment").hide();
    }
    
    if(type == "credit") {
      $("#due_date, #date_label, #minimum_payment, #balance, #credit_limit").show();
    }
    
    if(type == "bill") {
      $("#due_date, #minimum_payment").show();
      $("#credit_limit, #balance").hide();
    }
  });
});

// $($(this).find('option:selected').attr('class')).show();