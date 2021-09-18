$(document).ready(function(){
    $('#searchButton').click(function() {
        $.ajax({
                type: "POST",
                url: "search.asp",
                data:  $("#formID").serialize(),
                cache: false,
                dataType: "html",
                success: function(response){
                    alert("Click ok to search");
                    $('#searchDisplay').html(response.toString());
                },
                error: function(respose){
                    alert(respose);
                },
            });

        return false;
    });
});
    

function delete_row(id){
    
    if (confirm("Are you sure you want to delete this entry?")) {
        var el = this;
        // AJAX Request
        $.ajax({
            url: 'delete.asp?id='+id,
            cache:false,
            dataType: "text",
            success: function(response){
                // Remove row from HTML Table
                $("#"+id).css('background','tomato');
                $("#"+id).fadeOut(0,function(){
                    $("#"+id).remove();
                 });
                 
            },
            error: function(respose){
                alert(respose);
            },
            });
        return false;
    }
};
