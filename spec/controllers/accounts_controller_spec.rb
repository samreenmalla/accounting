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
 		expect {post :create, params:{account: FactoryGirl.attributes_for(:account)} }.to change(Account, :count).by(1)

 	end
 	it "redirects to root_path" do
 		post :create, params:{account: FactoryGirl.attributes_for(:account)}
 		expect(response). to redirect_to root_path
 	end
 end

 describe "GET #edit" do
 	it "edits the existing account" do
 		account = FactoryGirl.create(:account)
 		get :edit,params:{id:account.id}
 		expect(response). to render_template :edit

 	end

 end








end

