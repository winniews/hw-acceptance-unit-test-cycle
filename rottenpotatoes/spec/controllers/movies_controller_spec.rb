require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
	 before (:each) do
        @mock_attributes = {:title => 'Star wars', :release_date => '15/6/1999', :rating => 'PG'}
        @mock_movie = FactoryGirl.create(:movie)
    end
  describe 'POST create movie' do
     it 'saves a movie to database' do
      expect { 
      	post :create, movie: @mock_attributes
      }.to change(Movie, :count).by(1)
      end
  end

  describe 'GET show movies' do
     it 'show movie page' do
     	get :show, id: @mock_movie
     	expect(response).to render_template(:show)
      end
  end

  describe 'GET edit movie' do
     it 'edit movie page' do
     	get :edit, id: @mock_movie
     	expect(response).to render_template(:edit)
      end
  end

  describe 'GET similar movies page' do
     it 'shows movie page of same director' do
     	get :search_directors, id: @mock_movie
     	expect(response).to render_template(:search_directors)
      end
  end

  describe 'PUT update a movie' do
     it 'updates a movie attribute' do
     	put :update, id: @mock_movie, movie: @mock_attributes
     	expect(assigns(:movie)).to eq(@mock_movie)
      end
  end

  describe 'DELETE destroy a movie' do
     it 'destroy a movie' do
     	expect { 
      		delete :destroy, id: @mock_movie
      	}.to change(Movie, :count).by(-1)
      end
  end

  describe 'GET index of all movies' do
     it 'goes to index page' do
     	get :index
     	expect(response).to render_template(:index)
      end

      it 'goes to index page with sorting by title' do
     	get :index, {sort: 'title'}
     	expect(assigns(:title_header)).to eql('bg-warning hilite')
      end

       it 'goes to index page with sorting by release date' do
     	get :index, {sort: 'release_date'}
     	expect(assigns(:date_header)).to eql('bg-warning hilite')
      end
  end

describe 'PUT update a movie and remove director' do
     it 'updates a movie attribute and remove director' do
     	put :update, id: @mock_movie, movie: @mock_attributes
     	expect(assigns(:movie)).to eq(@mock_movie)
     	get :search_directors, id: @mock_movie
     	expect(assigns(:director)).to eq(nil)
      end
  end
  

end
