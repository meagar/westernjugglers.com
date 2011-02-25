
class RecordHoldersController < ApplicationController

	def new
		@holder = RecordHolder.new
		@holder.record = Record.find(params[:record_id])
	end

	def create
		@record = Record.find(params[:record_id])

		@holder = RecordHolder.new(params[:record_holder])
		@record.record_holders << @holder

		if @holder.save
			redirect_to @record, :notice => 'Record holder was successfully created.'
		else
			render :action => 'new'
		end
	end

	def edit
		@holder = RecordHolder.find(params[:id])
	end

	def update
		@holder = RecordHolder.find(params[:id])
		logger.info(params)

		if @holder.update_attributes(params[:record_holder])
			redirect_to @holder.record, :notice => 'Record holder was successfuly updated.'
		else
			render :action => 'edit'
		end
	end
end
