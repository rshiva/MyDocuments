/*

AJAX Plant JavaScript (PJS) libary
==========================

version:        0.1.0 RC1
author:            Dragan Lalos (rori), draganbl@gmail.com
copyright:        (c) Copyright by geeksolutions - Dragan Lalos


6.5.2007 - http://www.captain.at/howto-ajax-form-post-request.php (line: 21-55)

*/
function go(url) {
        if (url.charAt(0) == '/') location.href = url;
        else location.href = url;
    }


function closeedit ()
{
     var commentObj = document.getElementById('editstop');
     commentObj.style.display = "hidden";
}    
function PJS()
{
    
    
    //-- konstruktor ---------------------------------------------------------------------------
    
    this.request = false;
    
    // NON IE, regular XMLHTTP
    if(window.XMLHttpRequest) 
    {
        this.request = new XMLHttpRequest();
        if (this.request.overrideMimeType)
        {
            this.request.overrideMimeType('text/html');
        }
    }
    
    // IE 
    else if(window.ActiveXObject)
    {
        try 
        {
            this.request = new ActiveXObject("Msxml2.XMLHTTP");
        } 
        
        catch (e)
        {
            try 
            {
                this.request = new ActiveXObject("Microsoft.XMLHTTP");
            } 
            catch (e) {}
        }
    }
    
    if ( !this.request ) 
    {
         alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Your browser doesn\'t support XMLHttp connection');
         return false;
    }
    //------------------------------------------------------------------------------------------
    
    
    
    
    //-- change (change some element (ID) content) ---------------------------------------------
    this.change = function(targetID, sourceUrl)
    {
    
        if( !this.request )
        {
            alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Your browser doesn\'t support XMLHttp connection');    
            return 0;
        }
        else
        {
            var req = this.request;
        }
        
        // loading
        document.getElementById(targetID).innerHTML = '<div><img src="images/loading.gif"></div>';
        
        // XMLHttpRequest it's OK
        req.onreadystatechange = function()
        {   
            if(req.readyState == 4)
            {   
                if (req.status == 404)
                {
                    window.location="http://www.sharedigest.com/login.php";
                    return true;
                }
                 
                if(req.status == 200)
                {
                    data = req.responseText;
                    document.getElementById(targetID).innerHTML = data;
                }
                    
                else
                {
                    document.getElementById(targetID).innerHTML = "Plant Java Script error\n ErrorCode: 0x0002\n SystemMsg: " + req.statusText;
                }
            }
        }
            
        req.open("GET", sourceUrl, true);
        req.send(null);
    }
    //------------------------------------------------------------------------------------------
    
    //-- change (change some element (ID) content) ---------------------------------------------
    this.change_second = function(targetID, sourceUrl)
    {
    
        if( !this.request )
        {
            alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Your browser doesn\'t support XMLHttp connection');    
            return 0;
        }
        else
        {
            var req = this.request;
        }
        
        // loading
        document.getElementById("load").style.display='block';
        
        // XMLHttpRequest it's OK
        req.onreadystatechange = function()
        {   
            if(req.readyState == 4)
            {   
                if (req.status == 404)
                {
                    window.location="http://www.sharedigest.com/login.php";
                    return true;
                }
                        
                if(req.status == 200)
                {
                    data = req.responseText;
                    document.getElementById(targetID).innerHTML = data;
                }
                    
                else
                {
                    document.getElementById(targetID).innerHTML = "Plant Java Script error\n ErrorCode: 0x0002\n SystemMsg: " + req.statusText;
                }
            }
        }
            
        req.open("GET", sourceUrl, true);
        req.send(null);
    }
    //------------------------------------------------------------------------------------------
    
    //-- change (change some element (ID) content) ---------------------------------------------
    this.change_third = function(targetID, sourceUrl)
    {
    
        if( !this.request )
        {
            alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Your browser doesn\'t support XMLHttp connection');    
            return 0;
        }
        else
        {
            var req = this.request;
        }
        
        // loading
        //document.getElementById(targetID).innerHTML = '<div><img src="images/loading.gif"></div>';
        
        // XMLHttpRequest it's OK
        req.onreadystatechange = function()
        {   
            if(req.readyState == 4)
            {   
                if (req.status == 404)
                {
                    window.location="http://www.sharedigest.com/login.php";
                    return true;
                }
                 
                if(req.status == 200)
                {
                    data = req.responseText;
                    document.getElementById(targetID).innerHTML = data;
                }
                    
                else
                {
                    document.getElementById(targetID).innerHTML = "Plant Java Script error\n ErrorCode: 0x0002\n SystemMsg: " + req.statusText;
                }
            }
        }
            
        req.open("GET", sourceUrl, true);
        req.send(null);
    }
    //------------------------------------------------------------------------------------------
    
    
    //-- do_submit -----------------------------------------------------------------------------
    this.do_submit = function(method, url, parameters, ret_el)
    {
        if( !this.request )
        {
            alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Yout browser doesn\'t support XMLHttp connection');    
            return 0;
        }
        else
        {
            var req = this.request;
        }
        
        if(!method) { method = 'GET'; }
        
        if(method == 'GET' || method == 'get')
        {
            req.open('GET', url + parameters, true);
            req.send(null);
        }
        
        if(method == 'POST' || method == 'post')
        {
            
            // u slucaju da postoji return element u njega ide output
            if(ret_el)
            {
                req.onreadystatechange = function()
                {
                if(req.readyState == 4)                
                    {
                        if (req.status == 404)
                        {
                            window.location="http://www.sharedigest.com/login.php";
                            return true;
                        }
                        if(req.status == 200)
                        {
                            data = req.responseText;
                            if(ret_el != 0)
                            {
                                document.getElementById(ret_el).innerHTML = data;
                            }
                        }
                            
                        else
                        {
                            document.getElementById(ret_el).innerHTML = "Plant Java Script error\n ErrorCode: 0x0002\n SystemMsg: " + req.statusText;
                        }
                    }
                }
            }
            
            // nastavak forme
            req.open('POST', url, true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.setRequestHeader("Content-length", parameters.length);
            req.setRequestHeader("Connection", "close");
            req.send(parameters);
        }
    }
    //------------------------------------------------------------------------------------------
    
        
    //-- form_submit ---------------------------------------------------------------------------
    this.form_submit = function(formName, action, method, return_element)
    {
        if(!method) { method = 'GET'; }
        
        
        
        // GET METHOD
        if(method == 'GET' || method == 'get')
        {
            // var medju_string = "&";
            var this_form = document.forms[formName];
            var parameters = '?js=1&submit=1';
            var el_num = this_form.elements.length;
            var i = 0;
            
            for(i = 0; i < el_num; i++)
            {
                // provjerava postojanje elementa - naziva
                if(this_form.elements[i].name)
                {
                    // provjerava da li je element disejblovan
                    if(this_form.elements[i].disabled == false)
                    {

                        // radio && checkbox
                        if(this_form.elements[i].type == "checkbox" || this_form.elements[i].type == "CHECKBOX" || this_form.elements[i].type == "radio"|| this_form.elements[i].type == "RADIO")
                        {
                            if(this_form.elements[i].checked == true)
                            {
                                tmp_kobas = this_form.elements[i].name + '=' + this_form.elements[i].value;
                                parameters = parameters +'&'+ tmp_kobas;
                            }
                            else
                            {
                                ;
                            }
                        }

                        // textarea, text, select, hidden, password
                        else
                        {
                            tmp_kobas = this_form.elements[i].name + '=' + this_form.elements[i].value;
                            parameters = parameters +'&'+ tmp_kobas;
                        }
                    }
                }
            }
            
            // do it
            this.do_submit(method, action, parameters);
            
        }
        
        // POST METHOD
        if(method == 'POST' || method == 'post')
        {
            var this_form = document.forms[formName];
            var parameters = '?js=1&submit=1';
            var el_num = this_form.elements.length;
            var i = 0;
            
            for(i = 0; i < el_num; i++)
            {
                // provjerava postojanje elementa - naziva
                if(this_form.elements[i].name)
                {
                    // provjerava da li je element disejblovan
                    if(this_form.elements[i].disabled == false)
                    {

                        // radio && checkbox
                        if(this_form.elements[i].type == "checkbox" || this_form.elements[i].type == "CHECKBOX" || this_form.elements[i].type == "radio"|| this_form.elements[i].type == "RADIO")
                        {
                            if(this_form.elements[i].checked == true)
                            {
                                tmp_kobas = this_form.elements[i].name + '=' + encodeURI(this_form.elements[i].value);
                                parameters = parameters +'&'+ tmp_kobas;
                            }
                            else
                            {
                                ;
                            }
                        }

                        // textarea, text, select, hidden, password
                        else
                        {
                            tmp_kobas = this_form.elements[i].name + '=' + encodeURI(this_form.elements[i].value);
                            parameters = parameters +'&'+ tmp_kobas;
                        }
                    }
                }
            }
        }
        
        this.do_submit(method, action, parameters, return_element);
        
    }
    
    //-- do_submit -----------------------------------------------------------------------------
    this.do_submit_second = function(method, url, parameters, ret_el)
    {
        if( !this.request )
        {
            alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Yout browser doesn\'t support XMLHttp connection');    
            return 0;
        }
        else
        {
            var req = this.request;
        }
        
        if(!method) { method = 'GET'; }
        
        if(method == 'GET' || method == 'get')
        {
            req.open('GET', url + parameters, true);
            req.send(null);
        }
        
        if(method == 'POST' || method == 'post')
        {
            
            // u slucaju da postoji return element u njega ide output
            if(ret_el)
            {
                // loading
                document.getElementById("load").style.display='block';
        
                req.onreadystatechange = function()
                {
                if(req.readyState == 4)                
                    {
                        if (req.status == 404)
                        {
                            window.location="http://www.sharedigest.com/login.php";
                            return true;
                        }
                        if(req.status == 200)
                        {
                            data = req.responseText;
                            if(ret_el != 0)
                            {
                                document.getElementById(ret_el).innerHTML = data;
                            }
                        }
                            
                        else
                        {
                            document.getElementById(ret_el).innerHTML = "Plant Java Script error\n ErrorCode: 0x0002\n SystemMsg: " + req.statusText;
                        }
                    }
                }
            }
            
            // nastavak forme
            req.open('POST', url, true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.setRequestHeader("Content-length", parameters.length);
            req.setRequestHeader("Connection", "close");
            req.send(parameters);
        }
    }
    //------------------------------------------------------------------------------------------
    
        
    //-- form_submit ---------------------------------------------------------------------------
    this.form_submit_second = function(formName, action, method, return_element)
    {
        if(!method) { method = 'GET'; }
        
        
        
        // GET METHOD
        if(method == 'GET' || method == 'get')
        {
            // var medju_string = "&";
            var this_form = document.forms[formName];
            var parameters = '?js=1&submit=1';
            var el_num = this_form.elements.length;
            var i = 0;
            
            for(i = 0; i < el_num; i++)
            {
                // provjerava postojanje elementa - naziva
                if(this_form.elements[i].name)
                {
                    // provjerava da li je element disejblovan
                    if(this_form.elements[i].disabled == false)
                    {

                        // radio && checkbox
                        if(this_form.elements[i].type == "checkbox" || this_form.elements[i].type == "CHECKBOX" || this_form.elements[i].type == "radio"|| this_form.elements[i].type == "RADIO")
                        {
                            if(this_form.elements[i].checked == true)
                            {
                                tmp_kobas = this_form.elements[i].name + '=' + this_form.elements[i].value;
                                parameters = parameters +'&'+ tmp_kobas;
                            }
                            else
                            {
                                ;
                            }
                        }

                        // textarea, text, select, hidden, password
                        else
                        {
                            tmp_kobas = this_form.elements[i].name + '=' + this_form.elements[i].value;
                            parameters = parameters +'&'+ tmp_kobas;
                        }
                    }
                }
            }
            
            // do it
            this.do_submit_second(method, action, parameters);
            
        }
        
        // POST METHOD
        if(method == 'POST' || method == 'post')
        {
            var this_form = document.forms[formName];
            var parameters = '?js=1&submit=1';
            var el_num = this_form.elements.length;
            var i = 0;
            
            for(i = 0; i < el_num; i++)
            {
                // provjerava postojanje elementa - naziva
                if(this_form.elements[i].name)
                {
                    // provjerava da li je element disejblovan
                    if(this_form.elements[i].disabled == false)
                    {

                        // radio && checkbox
                        if(this_form.elements[i].type == "checkbox" || this_form.elements[i].type == "CHECKBOX" || this_form.elements[i].type == "radio"|| this_form.elements[i].type == "RADIO")
                        {
                            if(this_form.elements[i].checked == true)
                            {
                                tmp_kobas = this_form.elements[i].name + '=' + encodeURI(this_form.elements[i].value);
                                parameters = parameters +'&'+ tmp_kobas;
                            }
                            else
                            {
                                ;
                            }
                        }

                        // textarea, text, select, hidden, password
                        else
                        {
                            tmp_kobas = this_form.elements[i].name + '=' + encodeURI(this_form.elements[i].value);
                            parameters = parameters +'&'+ tmp_kobas;
                        }
                    }
                }
            }
        }
        
        this.do_submit_second(method, action, parameters, return_element);
        
    }
    //------------------------------------------------------------------------------------------
    
    
     //-- do_submit -----------------------------------------------------------------------------
    this.do_submit_third = function(method, url, parameters, ret_el)
    {
        if( !this.request )
        {
            alert('Plant Java Script error\n ErrorCode: 0x0001\n SystemMsg: Yout browser doesn\'t support XMLHttp connection');    
            return 0;
        }
        else
        {
            var req = this.request;
        }
        
        if(!method) { method = 'GET'; }
        
        if(method == 'GET' || method == 'get')
        {
            req.open('GET', url + parameters, true);
            req.send(null);
        }
        
        if(method == 'POST' || method == 'post')
        {
            
            // u slucaju da postoji return element u njega ide output
            if(ret_el)
            {
                // loading
                document.getElementById("load").style.display='block';
        
                req.onreadystatechange = function()
                {
                if(req.readyState == 4)                
                    {
                        if (req.status == 404)
                        {
                            window.location="http://www.sharedigest.com/login.php";
                            return true;
                        }
                        if(req.status == 200)
                        {
                            data = req.responseText;
                            if(ret_el != 0)
                            {
                                document.getElementById(ret_el).innerHTML = data;
                                setTimeout("closeedit()",1000)
                            }
                        }
                            
                        else
                        {
                            document.getElementById(ret_el).innerHTML = "Plant Java Script error\n ErrorCode: 0x0002\n SystemMsg: " + req.statusText;
                        }
                    }
                }
            }
            
            // nastavak forme
            req.open('POST', url, true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.setRequestHeader("Content-length", parameters.length);
            req.setRequestHeader("Connection", "close");
            req.send(parameters);
        }
    }
    //------------------------------------------------------------------------------------------
    
        
    //-- form_submit ---------------------------------------------------------------------------
    this.form_submit_third = function(formName, action, method, return_element)
    {
        if(!method) { method = 'GET'; }
        
        
        
        // GET METHOD
        if(method == 'GET' || method == 'get')
        {
            // var medju_string = "&";
            var this_form = document.forms[formName];
            var parameters = '?js=1&submit=1';
            var el_num = this_form.elements.length;
            var i = 0;
            
            for(i = 0; i < el_num; i++)
            {
                // provjerava postojanje elementa - naziva
                if(this_form.elements[i].name)
                {
                    // provjerava da li je element disejblovan
                    if(this_form.elements[i].disabled == false)
                    {

                        // radio && checkbox
                        if(this_form.elements[i].type == "checkbox" || this_form.elements[i].type == "CHECKBOX" || this_form.elements[i].type == "radio"|| this_form.elements[i].type == "RADIO")
                        {
                            if(this_form.elements[i].checked == true)
                            {
                                tmp_kobas = this_form.elements[i].name + '=' + this_form.elements[i].value;
                                parameters = parameters +'&'+ tmp_kobas;
                            }
                            else
                            {
                                ;
                            }
                        }

                        // textarea, text, select, hidden, password
                        else
                        {
                            tmp_kobas = this_form.elements[i].name + '=' + this_form.elements[i].value;
                            parameters = parameters +'&'+ tmp_kobas;
                        }
                    }
                }
            }
            
            // do it
            this.do_submit_third(method, action, parameters);
            
        }
        
        // POST METHOD
        if(method == 'POST' || method == 'post')
        {
            var this_form = document.forms[formName];
            var parameters = '?js=1&submit=1';
            var el_num = this_form.elements.length;
            var i = 0;
            
            for(i = 0; i < el_num; i++)
            {
                // provjerava postojanje elementa - naziva
                if(this_form.elements[i].name)
                {
                    // provjerava da li je element disejblovan
                    if(this_form.elements[i].disabled == false)
                    {

                        // radio && checkbox
                        if(this_form.elements[i].type == "checkbox" || this_form.elements[i].type == "CHECKBOX" || this_form.elements[i].type == "radio"|| this_form.elements[i].type == "RADIO")
                        {
                            if(this_form.elements[i].checked == true)
                            {
                                tmp_kobas = this_form.elements[i].name + '=' + encodeURI(this_form.elements[i].value);
                                parameters = parameters +'&'+ tmp_kobas;
                            }
                            else
                            {
                                ;
                            }
                        }

                        // textarea, text, select, hidden, password
                        else
                        {
                            tmp_kobas = this_form.elements[i].name + '=' + encodeURI(this_form.elements[i].value);
                            parameters = parameters +'&'+ tmp_kobas;
                        }
                    }
                }
            }
        }
        
        this.do_submit_third(method, action, parameters, return_element);
        
    }
    //------------------------------------------------------------------------------------------
    


}