class WelcomeController < ApplicationController
  authorize_resource class: false

  def home
    @forum = Narrative.include_main_forum.find_by(main_forum: true)
  end

  def media
    @narratives = Narrative.archived
  end
end
