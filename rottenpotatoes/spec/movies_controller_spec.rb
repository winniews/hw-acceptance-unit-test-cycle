require 'rails_helper'

RSpec.describe MoviesController do 
	describe "GET index" do
		get :index
		expect(response).to be_succesful
	end

end