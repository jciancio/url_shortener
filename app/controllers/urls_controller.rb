class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  before_action :set_url_alt, only: :show_alt
  before_action :create_short, only: :new

  def index
    @urls = Url.all
  end

  def show
    redirect_to @url.original
  end

  def show_alt
    redirect_to @url.original
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_path, notice: 'Url shortened!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @url.update(url_params)
      redirect_to @url, notice: 'Url updated.'
    else
      render :edit
    end
  end

  private
  def url_params
    params.require(:url).permit(:original, :short)
  end

  def set_url
    @url = Url.find(params[:id])
  end

  def set_url_alt
    @url = Url.find_by(short: params[:short])
  end

  def create_short
    @short = UrlGenerator.generate
  end
end
