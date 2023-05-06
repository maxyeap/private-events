class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @events = Event.all.order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to action: 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :date,
                                  :location).merge(date: Date.new(params['event']['date(1i)'].to_i, params['event']['date(2i)'].to_i,
                                                                  params['event']['date(3i)'].to_i))
  end
end
