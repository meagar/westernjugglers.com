class ExecutivesController < ApplicationController

	def index
    @executives = Executive.current
  end
 
	def show
    @executive = Executive.find(params[:id])
	end

	def edit
    @executive = Executive.find(params[:id])
	end

  def update
    @executive = Executive.find(params[:id])

		if @executive.update_attributes(params[:executive])
			redirect_to @executive, :notice => 'Executive was successfully updated.'
		else
			render :action => "edit"
		end
  end


  def new
    @executive = Executive.new
  end
  
  def create
    @executive = Executive.new params[:executive]
    
    if @executive.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

end
