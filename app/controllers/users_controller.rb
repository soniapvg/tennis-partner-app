class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  layout 'user_default'


  # GET /users or /users.json
  def index
    @partners = User.where.not(id: current_user.id)
    @q = @partners.ransack(params[:q])
    @partners = @q.result(distinct: true)
  end
  
  # GET /users/1 or /users/1.json
  def show
    if current_user != @user
      if current_user.has_chatroom_with?(@user)
        @have_chatroom = true
        @chatroom = current_user.common_chatroom_id_with(@user)
      else
        @have_chatroom = false
        @chatroom = Chatroom.new
      end
    end
    render layout: 'layouts/user_actions'
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    render layout: 'layouts/user_actions'
  end

  def search
    render layout: 'layouts/user_actions'
  end

  def selection
    @user = current_user
    @partners = User.search(partner_params, @user)

    if @partners.empty?
      flash[:filter] = "Aucun joueur de ton niveau n'est disponible sur ce créneau. Voici des joueurs disponibles à d'autres moments !"
      @partners = User.where.not(id: @user.id)
      @partners = User.filter_level(@partners, @user)

      if @partners.empty?
        flash[:filter] = "Il n'y a malheureusement aucun joueur de ton niveau inscrit sur notre site. Voici la liste complète des joueurs."
        @partners = User.where.not(id: @user.id)
      end
    end

    redirect_to users_display_path(:partners => @partners)
  end

  def display
    results = params[:partners]
    @partners = []
    if results
      results.each do |result|
        iresult = result.to_i
        @partners << User.find(iresult)
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), success: "Modifications enregistrées." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, success: "Le compte a bien été supprimé." }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :code_club, :date_of_birth, :gender, :experience, :description, :week_day, :week_night, :weekend_day, :weekend_night, :outside)
    end

    def partner_params
      params.permit(:gender, :week_day, :week_night, :weekend_day, :weekend_night, :inside, :authenticity_token, :commit, :method, :button)
    end

end
