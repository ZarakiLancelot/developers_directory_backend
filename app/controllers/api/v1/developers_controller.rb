# frozen_string_literal: true

class Api::V1::DevelopersController < ApplicationController
  before_action :set_developer, only: %i[ show update destroy ]

  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  # GET /developers/1
  # GET /developers/1.json
  def show
    Faraday.default_adapter = :net_http

    url = "https://api.github.com/users/#{params[:id]}"
    Rails.logger.info url

    @search = Faraday.get(url) do |req|
      req.headers['Authorization'] = "token #{ENV['TOKEN']}"
      Rails.logger.debug req
    end
    @developer = JSON.parse(@search.body)

    Rails.logger.debug @developer
    render :show
  end

  def repos
    @search_repos = Faraday.get(url) do |req|
      req.headers['Authorization'] = "token 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"
    end
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
      @developer = Developer.find_by_username(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def developer_params
      params.require(:developer).permit(:username)
    end
end
