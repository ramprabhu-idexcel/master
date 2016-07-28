class EventsController < ApplicationController
  def index
    @events = Event.all.reverse
    @message = Message.new
  end
end
