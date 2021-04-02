require 'rails_helper'
include Requests

RSpec.describe 'V1::Shifts', type: :request do
  let!(:shifts) { create_list(:shift, 3) }
  let!(:shift_param){ { name: 'Kim Shift', date: DateTime.current.to_date, start_time: Time.now, end_time: Time.now + 1 } }

  describe "GET /v1/shifts" do
    it "returns all shifts" do
      json_get '/v1/shifts', {}
      expect(json_response.count).to eq(shifts.count)
    end
  end

  describe "POST /v1/shifts" do
    it "creates shift with the given name, date, start time and end time" do
      json_post '/v1/shifts', {
        shift: shift_param
      }
      last_shift = Shift.last
      expect(Shift.all.count).to eq(4)
      expect(last_shift.name).to eq('Kim Shift')
      expect(last_shift.date).to eq(shift_param[:date])
    end
  end

  describe "POST /v1/shifts" do
    it "creates shift with the given name, date, start time and end time" do
      json_post '/v1/shifts', {
        shift: shift_param
      }
      last_shift = Shift.last
      expect(Shift.all.count).to eq(4)
      expect(last_shift.name).to eq('Kim Shift')
      expect(last_shift.date).to eq(shift_param[:date])
    end
  end

  describe "PUT V1:Shifts" do
    it "Update shift" do
      last_shift = shifts.last
      json_put "/v1/shifts/#{last_shift.id}", {
        shift: shift_param
      }
      last_shift.reload
      expect(last_shift.name).to eq('Kim Shift')
      expect(last_shift.date).to eq(shift_param[:date])
    end
  end

  describe "DEL V1:Shifts" do
    it "delete shift" do
      last_shift = shifts.last
      expect(Shift.all.count).to eq(3)

      json_delete "/v1/shifts/#{last_shift.id}", {}
      expect(Shift.all.count).to eq(2)
    end
  end
end
