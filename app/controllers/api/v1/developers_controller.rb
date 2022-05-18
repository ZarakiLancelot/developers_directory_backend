class Api::V1::DevelopersController < ApplicationController
  before_action :set_developer, only: %i[ show update destroy ]

  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  def show_developer
    @developer = Developer.find_by_username(params[:username])
    render json: @developer.to_json(only: [:public_repos, :name, :location])
  end

  # GET /developers/1
  # GET /developers/1.json
  def show
  end

  # POST /developers
  # POST /developers.json
  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      render :show, status: :created, location: @developer
    else
      render json: @developer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /developers/1
  # PATCH/PUT /developers/1.json
  def update
    if @developer.update(developer_params)
      render :show, status: :ok, location: @developer
    else
      render json: @developer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.json
  def destroy
    @developer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def developer_params
      params.require(:developer).permit(:username)
    end
end
