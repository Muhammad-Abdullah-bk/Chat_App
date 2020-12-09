class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @rooms = Room.all
    @room_massage = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
    @room_message = RoomMessage.create user: current_user, room: @room, message: params.dig(:room_message, :message)

    RoomChannel.broadcast_to @room, @room_message
    if @room_message.save!
    respond_to do |format|
      format.html{}
      format.js
    end
    end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
