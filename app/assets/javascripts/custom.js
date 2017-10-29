$(document).ready(function() {
  $("#minimum_payment, #due_date, #date_label, #balance, #credit_limit, #apr").hide();
  
  $("#account_type").change(function(){
    var type = $(this).find("option:selected").attr('id');
    // window.alert("Account type is: " + type + "!");
    
    if(type == "bank" || type == "cash") {
      $("#balance").show();
      $("#credit_limit, #due_date, #date_label, #minimum_payment, #apr").hide();
    }
    
    if(type == "credit") {
      $("#due_date, #date_label, #minimum_payment, #balance, #credit_limit, #apr").show();
    }
    
    if(type == "bill") {
      $("#due_date, #minimum_payment").show();
      $("#credit_limit, #balance, #apr").hide();
    }
  });
});

$(document).ready(function() {
  var trans_type;
  
  $(".debit-transaction").click(function(){
    trans_type = "Debit";
    console.log(trans_type);
  });
});


$(document).ready(function() {
  $("#transactionOptions").accordion({
    collapsible: true,
    active: false,
    // icons: {
    //   header: "ui-icon-circle-arrow-e",
    //   activeHeader: "ui-icon-circle-arrow-s"
    //   },
    heightStyle: "content"
    });
  //   $("#resizer").resizable({
  //     resize: function(){
  //     $("#trans_options").accordion("refresh");
  //   }
  // });
});

$(document).ready(function() {
  $('#myTable').DataTable();
});

$(document).ready(function() {
  $("#due_date, #transaction_date").datepicker();
});




