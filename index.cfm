<html>
    <head>
        <link rel="stylesheet" href = "css/style.css">
        <title>Task 6</title>
    </head>
    <body>
        <section>
            <div class="main_container">
                <div class = "forms card">
                    <h3>Structure Function</h3>
                    <hr>                    
               <cfform name="cftask_5" action="">
                      <div class="form-group">
                                          
                        <label>Name</label>
                            <input type="text" name="first_name" 
                            required placeholder="First Name" autocomplete="off">
                        </div>
                      
                        <div class="form-group">
                                         
                        <label>Display Value</label>
                    <input type="text" name="depart"  required placeholder="Type Your Department" autocomplete="off">
                        </div>
                    
                
                        <div class="form-btn-control">
                            <input type="submit" class="common-btn" name="submit" 
                            value="Submit"/>
                        </div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>

 <cfif structKeyExists(form,'Submit')>
<cfset titles = StructNew()> 
<cfset a = StructInsert(titles, "#form.first_name#", "#form.depart#", 1)>  

<cfset myArray = arrayNew(1)>
  <cfset arrayAppend(myArray, titles)>
  
  <cfset key=form.first_name>
  <cfset value=form.depart>
 <cfapplication name="structures" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
                        sessionManagement = "Yes">    
<cfif NOT StructKeyExists(Session, "mystruct")>
    <cflock timeout=20 scope="Session" type="Exclusive">
      <cfset Session.mystruct = structNew()>
    </cflock>
</cfif>

<cfif StructKeyExists(Session, "mystruct")>
  <cfif IsDefined("key") AND  IsDefined("value") >

    <cfif NOT StructKeyExists(Session.mystruct,"#key#")>
      <cfset Session.mystruct["#key#"] = #value#> 
    </cfif>

     <cfif  StructKeyExists(Session.mystruct,"#key#")>
   <cfset  StructUpdate(Session.mystruct,"#key#",#value#)>
        </cfif>
  </cfif>
</cfif>

<cfdump var="#Session.mystruct#">	
</cfif>
  
