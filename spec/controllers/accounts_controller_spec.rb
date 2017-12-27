require 'rails_helper' 
RSpec.describe AccountsController, type: :controller do

 describe "GET #index" do
 	it "renders the index template" do
 		get :index
 		expect(response).to render_template :index
	end
 end

 describe "POST #create" do
 	it "creates a new account" do

 	end
 	it "redirects to root_path" do
 	end
 end





end