function send_contact()
{   
    var DY1        = new PJS;
    DY1.form_submit_second('contact_form', 'contact_deamon.php?do=send_contact', 'post', 'contactform');
      
    return false;
}

function show_image(username, user_id)
{ 
    var DY3        = new PJS;
    DY3.change('user_picture', 'user_deamon.php?do=show_image&username=' + username +'&uset_id='+user_id);
}

function validate_form(field)
{
    var field = document.getElementById("doc").value;
    
    if (field == "" || field == null)
    {
        alert ("Image field is empty.");
        return false
    }
    else
    {
        document.getElementById("imgs").style.display='block';
        document.getElementById("upload").style.display='none'; 
        return true
    } 
}