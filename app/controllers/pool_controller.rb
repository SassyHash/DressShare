class PoolController < ApplicationController

	def new
		@pool = Pool.new()
	end

	def create
		@pool = current_user.pools.build(params[:pool])
		if @pool.save
			flash[:notices] = "You have made a new dress pool!"
			redirect_to pool_path(@pool)
		end
	end

	def edit
	end

	def update
	end


	def destroy
	end

end
