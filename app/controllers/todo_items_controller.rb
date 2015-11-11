class TodoItemsController < ApplicationController
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create]

	# INFO
		# success: & error: are custom flashtypes, check application_controller.rb

	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list, success: "Todo was successfully created"
	end

	def destroy
		if @todo_item.destroy
			redirect_to @todo_list, success: "Todo was successfully deleted"
		else
			redirect_to @todo_list, error: "Todo item could not be deleted"
		end
	end


	def complete
		@todo_item.update_attribute(:completed_at, Time.now)
		redirect_to @todo_list, success: "Todo was completed, good job :)"
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end

end
