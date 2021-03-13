Rails.application.routes.draw do

  get("/", { :controller => "user_authentication", :action => "home" })

  # VIEW ALL ARTISTS AND CONCERTS
  get("/view_all", { :controller => "artists", :action => "view_everything" })

  # Routes for the Interest resource:

  # CREATE
  post("/insert_interest", { :controller => "interests", :action => "create" })
          
  # READ
  get("/interests", { :controller => "interests", :action => "index" })
  
  get("/interests/:path_id", { :controller => "interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_interest/:path_id", { :controller => "interests", :action => "update" })
  
  # DELETE
  get("/delete_interest/:path_id", { :controller => "interests", :action => "destroy" })

  #------------------------------

  # Routes for the Tour resource:

  # CREATE
  post("/insert_tour", { :controller => "tours", :action => "create" })
          
  # READ
  get("/tours", { :controller => "tours", :action => "index" })
  
  get("/tours/:path_id", { :controller => "tours", :action => "show" })
  
  # UPDATE
  
  post("/modify_tour/:path_id", { :controller => "tours", :action => "update" })
  
  # DELETE
  get("/delete_tour/:path_id", { :controller => "tours", :action => "destroy" })

  #------------------------------

  # Routes for the Artist resource:

  # CREATE
  post("/insert_artist", { :controller => "artists", :action => "create" })
          
  # READ
  get("/artists", { :controller => "artists", :action => "index" })
  
  get("/artists/:path_id", { :controller => "artists", :action => "show" })
  
  # UPDATE
  
  post("/modify_artist/:path_id", { :controller => "artists", :action => "update" })
  
  # DELETE
  get("/delete_artist/:path_id", { :controller => "artists", :action => "destroy" })

  #------------------------------

  # Routes for the Follow resource:

  # CREATE
  post("/insert_follow", { :controller => "follows", :action => "create" })
          
  # READ
  get("/follows", { :controller => "follows", :action => "index" })
  
  get("/follows/:path_id", { :controller => "follows", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow/:path_id", { :controller => "follows", :action => "update" })
  
  # DELETE
  get("/delete_follow/:path_id", { :controller => "follows", :action => "destroy" })

  #------------------------------

  # Routes for the Concert resource:

  # CREATE
  post("/insert_concert", { :controller => "concerts", :action => "create" })
          
  # READ
  get("/concerts", { :controller => "concerts", :action => "index" })
  
  get("/concerts/:path_id", { :controller => "concerts", :action => "show" })
  
  # UPDATE
  
  post("/modify_concert/:path_id", { :controller => "concerts", :action => "update" })
  
  # DELETE
  get("/delete_concert/:path_id", { :controller => "concerts", :action => "destroy" })

  get("/saved_concerts", { :controller => "concerts", :action => "bookmarked_concerts" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  # UPDATE HOME CITY
  post("/modify_home_city", { :controller => "user_authentication", :action => "update_home_city" })
  # UPDATE PHONE NUMBER
  post("/modify_phone_number", { :controller => "user_authentication", :action => "update_phone_number" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  get("/user_profile", { :controller => "user_authentication", :action => "my_profile" })

end
