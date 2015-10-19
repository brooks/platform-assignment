class UsersController < ApplicationController

  def index
    search_users
  end

  def search
    search_users(params[:query])

    respond_to do |format|
      format.json { render :json => @users.to_json }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.json { render :json => @user.to_json }
      format.html
    end  
  end

  private

  def search_users(query=nil)
    if query.blank?
      @users = User.order('RAND()').limit(500)
    else
      @users = User.where(
        sql_columns, *sql_values(query)
      ).limit(500)
    end
  end

  def sql_columns
    %Q( 
      name LIKE ?
      OR line1 LIKE ?
      OR line2 LIKE ?
      OR city LIKE ?
      OR state LIKE ?
      OR zip LIKE ?
      OR phone LIKE ?
    )  
  end

  def sql_values(query)
    Array.new(7,"%#{query}%")
  end
  
end
