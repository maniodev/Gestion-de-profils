class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :comment, :delete_image]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.page(params[:page]).per(10)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @comment = Comment.new
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def comment
    @comment = Comment.new(comment_params)
    @comment.profile = @profile

    respond_to do |format|
      if @comment.save
        # byebug
        format.js
        format.html { redirect_to @comment.profile, notice: 'Comment was successfully created.' }
      else
        # byebug
        puts @comment.inspect
        format.js
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def export
    @profiles = Profile.where(id: params[:profiles])
    request.format = 'pdf'
    respond_to do |format|
      format.pdf do
       render :pdf => 'file_name',
       :template => 'profiles/export.pdf.erb',
       :layout => 'pdf.html.erb',
       :show_as_html => params[:debug].present?
     end
    end
  end


  def delete_image
    @profile.remove_avatar!
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'The photo has been deleted' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:nom, :prenom, :dob, :avatar, :address, :about)
    end

    def comment_params
      params.require(:comment).permit(:author, :content,:id)
    end
end
