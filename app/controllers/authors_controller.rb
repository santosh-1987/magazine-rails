class AuthorsController < ApplicationController
  before_action :get_author, except: [:index, :create]
  respond_to :html, :json

  def index
    @author = Author.all
    respond_with(@authors) do |format|
      format.json { render :json => @author.as_json }
      format.html
    end
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author.as_json, status: :ok
    else
      render json: {author: @author.errors, status: :no_content}
    end
  end

  def show
    respond_with(@author.as_json)
  end

  def update
    if @author.update_attributes(author_params)
      render json: @author.as_json, status: :ok
    else
      render json: {author: @author.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @author.destroy
    render json: {status: :ok}
  end

  private

  def author_params
    unless params["author"]["addresses"].blank?
      params["author"]["addresses_attributes"] = params["author"]["addresses"]
      params["author"].delete("addresses")
    end
    params.fetch(:author, {}).permit(:first_name, :last_name, :email, :phone,:addresses_attributes => [:id, :street1, :street2, :city, :state, :country, :zipcode, :_destroy, :author_id])
  end

  def get_author
    @author = Author.find(params[:id])
    render json: {status: :not_found} unless @author
  end

end
