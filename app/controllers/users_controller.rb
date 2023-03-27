class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  layout 'user'
  

  # GET /users or /users.json
  def index
    # @users = User.all

    results = params[:partners]
    @partners = []
    if results
    results.each do |result|
        iresult = result.to_i
        @partners << User.find(iresult)
      end
    end
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
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def search
  end

  def selection
    @user = current_user
    @partners = User.search(partner_params,@user)

    redirect_to users_path(:partners => @partners)
  end

  def affichage
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
        format.html { redirect_to edit_user_path(@user), notice: "Modifications enregistrées." }
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
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
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
      params.require(:user).permit(:date_of_birth, :gender, :experience, :description, :week_day, :week_night, :weekend_day, :weekend_night)
    end

    def partner_params
      params.permit(:gender, :week_day, :week_evening, :wend_day, :wend_evening, :inside, :authenticity_token, :commit, :method)
    end
end
