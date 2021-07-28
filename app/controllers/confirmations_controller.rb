class ConfirmationsController < Devise::ConfirmationsController
    
    private

        def after_confirmation_path_for(resource_name, resource)
            sign_in(resource)
<<<<<<< HEAD
            new_user_session_path
=======
            root_path
>>>>>>> origin/Mail_Narrative
        end
end