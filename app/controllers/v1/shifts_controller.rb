module V1
  class ShiftsController < ApplicationController

    def index
      render json: Shift.all.to_json, adapter: :json, status: 200
    end

    def show
      render json: @shift.to_json
    end

    def update
      if shift.update(shift_params)
        render json: shift, status: 200
      else
        render json: { errors: shift.errors }, status: 422
      end
    end

    def create
      shift = Shift.new(shift_params)
      if shift.save
        render json: { message: 'Successfully updated' }, status: 200
      else
        render json: { errors: shift.errors }, status: 422
      end
    end

    def destroy
      if shift.destroy
        render json: { message: 'Successfully deleted' }, status: 200
      else
        render json: { errors: shift.errors }, status: 422
      end
    end

    private 
    
    def shift_params
      params.require(:shift).permit(
              :name,
              :date,
              :start_time,
              :end_time
            )
    end

    def shift
      @shift ||= Shift.find(params[:id])
    end
  end
end
