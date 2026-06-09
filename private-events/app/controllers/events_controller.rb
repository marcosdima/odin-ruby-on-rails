class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: %i[ show ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params.expect(
        event: [ :location, :starts_at, :description, :title ]
      )
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
