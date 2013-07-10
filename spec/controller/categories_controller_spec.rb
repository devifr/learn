require "spec_helper"
describe CategoriesController, :type => :controller do

  let(:valid_attributes) { { "name" => "Katakata" } }
  let(:category) { Category.create! valid_attributes }
  
  it {should_not be_nil}

  describe "GET #index" do
      
    it "responds successfully with an HTTP 200 status code" do
      get :index
      should render_template(:index)
      should respond_with 200
    end

    it "assigns all categories as @categories" do
      Category.should_receive(:all).exactly(1).times.and_return([category])
      get :index
      assigns(:categories).should eq([category])
    end

    it "renders the index template" do
      get :index
      should render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      assigns(:category).should be_a_new(Category)
    end
  end

  describe "GET #show" do
    it "assigns the requested category as @category" do
      Category.should_receive(:find).with(category.id.to_s).exactly(1).times.and_return(category)
      get :show, {:id => category.id}      
      assigns(:category).should eq(category)
    end
  end

  describe "GET #edit" do
    it "assigns the requested example as @example" do
      get :edit, {:id => category.to_param}
      assigns(:category).should eq(category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, {:category => valid_attributes}}.to change(Category, :count).by(1)
      end

      it "assigns a newly created example as @category" do
        post :create, {:category => valid_attributes}
        assigns(:category).should be_a(Category)
        assigns(:category).should be_persisted
      end

      it "redirects to the created example" do
        post :create, {:category => valid_attributes}
        response.should redirect_to(Category.last)
      end
    end 
    describe "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => { "name" => "invalid value" }}
        assigns(:category).should be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => { "name" => "invalid value" }}
        response.should render_template("new")
      end
    end    
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested category" do
        Category.any_instance.should_receive(:update_attributes).with({ "name" => "value"})
        put :update, {:id => category.to_param, :category => { "name" => "value" }}
      end

      it "assigns the requested category as @category" do
        put :update, {:id => category.to_param, :category => valid_attributes}
        assigns(:category).should eq(category)
      end

      it "redirects to the category" do
        put :update, {:id => category.to_param, :category => valid_attributes}
        response.should redirect_to(category)
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}
        assigns(:category).should eq(category)
      end

      it "re-renders the 'edit' template" do
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end 

  describe "DELETE destroy" do
    it "destroys the requested category" do
      expect {
        delete :destroy, {:id => category.id}
      }.to change(Category, :count).by(0)
    end

    it "redirects to the category list" do
      delete :destroy, {:id => category.id}
      response.should redirect_to(categories_url)
    end
  end

end