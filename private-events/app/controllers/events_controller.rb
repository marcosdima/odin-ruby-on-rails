class EventsController < ApplicationController
  before_action :set_event, only: %i[ show ]
  def index
    @events = Event.all
  end

  def show
  end

  private
    def event_params
      params.expect(event: [ :location, :date ])
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
