require 'clearance'

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true
  def current_user
    if remember_token.present?
      @current_user ||= user_from_remember_token(remember_token)
    end

    @current_user
  end

  def remember_token
    cookies[remember_token_cookie]
  end

  def remember_token_cookie
    Clearance.configuration.cookie_name.freeze
  end

  def user_from_remember_token(token)
    Clearance.configuration.user_model.where(remember_token: token).first
  end

  def signed_in?
    current_user.present?
  end


  config.authenticate_with do
    if !signed_in?
      redirect_to '/' 
    elsif !current_user.admin?
      flash[:danger] = "You do not have the permission to visit the page."
      redirect_to '/'
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # config.model Company do
  #   field :users do
  #     associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
  #     associated_collection_scope do
  #       company = bindings[:object]
  #       Proc.new { |scope|
  #         scope = scope.where(user_id: current_user.company_id) 
  #       }
  #     end
  #   end
  # end

  # config.model User do
  #   field :users do
  #     associated_collection_cache_all false  
  #     associated_collection_scope do
  #       # bindings[:object] & bindings[:controller] are available, but not in scope's block!
  #       # team = bindings[:object]
  #       Proc.new { |scope|
  #         # scoping all Players currently, let's limit them to the team's league
  #         # Be sure to limit if there are a lot of Players and order them by position
  #         scope = scope.where(company_id: current_user.company_id)
  #         # scope = scope.limit(30) # 'order' does not work here
  #       }
  #     end
  #   end
  # end

  config.excluded_models << Company


end
