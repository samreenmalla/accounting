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

 describe "PUT #update" do
 	context "if attributes are valid" do
 		it "updates the existing account" do
 			account = FactoryGirl.create(:account)
			put :update,  params:{id: account.id,account: FactoryGirl.attributes_for(:account,date:'2017-12-4', title: 'Harry', amount: '15000')}
  				account.reload
  				expect(account.date).to eq("2017-12-4")
 				 expect(account.title).to eq("Harry")
 				 expect(account.amount).to eq("15000")

 		end
 		it "redirects to root_path" do
 			account =FactoryGirl.create(:account)
 			put :update, params:{id: account.id,account:FactoryGirl.attributes_for(:account)}
 			expect(response). to redirect_to root_path
 		end
 	end
 	context "attributes are invalid" do
 		it "doesn't update the account" do
 			account= FactoryGirl.create(:account)
				put :update, params:{id: account.id,account: FactoryGirl.attributes_for(:account, date: '2017-03-30', title:'abcd', amount:'five thousand')}
  				account.reload
  				expect(account.date).to_not eq("2017-03-30")
  				expect(account.title).to_not eq("abcd")
  				expect(account.amount).to_not eq("five thousand")
 		end 
 		it "renders the edit template" do
 			account= FactoryGirl.create(:account)
				put :update, params:{id: account.id,account: FactoryGirl.attributes_for(:invalid_post)}
  				expect(response).to redirect_to edit_account_path
 		end
 	end
 end

 describe "DELETE #destroy" do
 	it "deletes the account" do
 		account = FactoryGirl.create(:account)
  		expect {delete :destroy, params:{id: account.id}}.to change(Account, :count).by(-1)
 	end
 	it "redirects to root path" do
 		account = FactoryGirl.create(:account)
 		delete :destroy, params:{id: account.id}
 		expect(response).to redirect_to root_path
 	end
 end

 end








