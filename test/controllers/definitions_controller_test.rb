require 'test_helper'

class DefinitionsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  setup do
    @definition = definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create definition" do
      count_before = Definition.count
      post :create, definition: { meaning: @definition.meaning, word: 'foo' }
      count_after = Definition.count

      assert_equal count_before + 1, count_after

    assert_redirected_to definition_path(assigns(:definition))
  end

  test "should show definition" do
    get :show, id: @definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @definition
    assert_response :success
  end

  test "should update definition" do
    patch :update, id: @definition, definition: { meaning: @definition.meaning, word: "something" }
    assert_redirected_to definition_path(assigns(:definition))
  end

  test "should destroy definition" do
    assert_difference('Definition.count', -1) do
      delete :destroy, id: @definition
    end
    assert_redirected_to definitions_path
  end

  test "should search" do
  get :search, search: "Ruby"
  expected_definition = [definitions(:one)]
  assert_equal expected_definition, assigns(:definitions)
  end

end
