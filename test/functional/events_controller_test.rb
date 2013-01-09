require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, approved: @event.approved, cancel_message: @event.cancel_message, cancelled: @event.cancelled, created_at: @event.created_at, des_en: @event.des_en, des_es: @event.des_es, des_eu: @event.des_eu, des_fr: @event.des_fr, description: @event.description, email: @event.email, finish_date: @event.finish_date, id: @event.id, phone: @event.phone, place: @event.place, price: @event.price, province: @event.province, reminded: @event.reminded, start_date: @event.start_date, tickets: @event.tickets, title: @event.title, title_en: @event.title_en, title_es: @event.title_es, title_eu: @event.title_eu, title_fr: @event.title_fr, town: @event.town, updated_at: @event.updated_at, user_id: @event.user_id, views: @event.views, website: @event.website }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { address: @event.address, approved: @event.approved, cancel_message: @event.cancel_message, cancelled: @event.cancelled, created_at: @event.created_at, des_en: @event.des_en, des_es: @event.des_es, des_eu: @event.des_eu, des_fr: @event.des_fr, description: @event.description, email: @event.email, finish_date: @event.finish_date, id: @event.id, phone: @event.phone, place: @event.place, price: @event.price, province: @event.province, reminded: @event.reminded, start_date: @event.start_date, tickets: @event.tickets, title: @event.title, title_en: @event.title_en, title_es: @event.title_es, title_eu: @event.title_eu, title_fr: @event.title_fr, town: @event.town, updated_at: @event.updated_at, user_id: @event.user_id, views: @event.views, website: @event.website }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
