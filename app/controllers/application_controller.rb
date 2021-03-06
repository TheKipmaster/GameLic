class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :finish_registration

  rescue_from CanCan::AccessDenied do |exception|
    # render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

  private

  def finish_registration
    if current_user and current_user.sing_up_complete?
      redirect_to edit_user_path(current_user)
    end
  end
end
