class WelcomeController < ApplicationController
  authorize_resource class: false

  def home
    @forum = Narrative.include_main_forum.find_by(main_forum: true)
  end

  def media
    semesters = Set[]
    narratives = Narrative.archived
    @media = {}

    narratives.each do |narrative|
      semesters.add(narrative.archived_at)
    end

    semesters.each do |time|
      @media[time.strftime("%B/%Y").to_sym] = narratives.where(archived_at: time)
    end
  end
end
