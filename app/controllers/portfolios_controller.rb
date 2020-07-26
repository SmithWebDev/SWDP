 class PortfoliosController < ApplicationController
   before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
   layout 'portfolio'
   access all: [:show, :index, :ruby], user: {except: [:edit, :new, :create, :update, :destroy]}, site_admin: :all
  def index
    @portfolio_items = Portfolio.by_position
   # @page_title = "My Portfolio"
  end

  def ruby     #Example of custom controller for hard coded category routing
    @ruby_portfolio_items = Portfolio.ruby 
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build } #hard coded 3 attributes for technologies
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.;' }
      else
        format.html { render :new }
      end
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def show
  end
  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url,notice: 'Portfolio item was successfully destroyed.' }
    end
  end


  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                     )
  end
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
