class Admin::MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path, notice: "Movie added successfully! 🎬"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path, notice: "Movie updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_movies_path, notice: "Movie deleted!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre, :duration, :description, :image_url)
  end

end
