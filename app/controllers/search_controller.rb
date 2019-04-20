class SearchController < ApplicationController

  def search
    keyword = params["keyword"]
    filters = params[:search_filters]
    redirect_to results_path(:keyword => keyword, :filters => filters)
  end

  def results
    keyword = "%" + params["keyword"] + "%"
    filters = params[:search_filters]
    if !filters['App'].nil?
      @apps = App.where('name LIKE ?', keyword).all()
    end
    if (filters['Document'] == 1)
      @orgs = Org.where('name LIKE ?', keyword).all()
    end
    if (filters['User'] == 1)
      @users = User.where('name LIKE ?', keyword).all()
    end
  end
end
