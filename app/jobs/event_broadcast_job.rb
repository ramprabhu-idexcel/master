class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
    ActionCable.server.broadcast 'activity_channel', message: render_event(event)
  end

  private
  def render_event(event)
    ApplicationController.renderer.render(partial: 'events/event', locals: { event: event, index: event.id })
  end
end
