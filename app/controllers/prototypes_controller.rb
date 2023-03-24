class PrototypesController < ApplicationController
  layout 'prototypes/layouts/application_members', except: [:signin, :signup]

  def signin
    render layout: 'prototypes/layouts/application'
  end

  def signup
    render layout: 'prototypes/layouts/application'
  end
end
