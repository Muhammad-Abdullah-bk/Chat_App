class ChatsController < ApplicationController
  def create
    @chat = Chat.get(current_user.id, params[:user_id])

    add_to_chats unless chatted?

    respond_to do |format|
      format.js
    end
  end

  def close
    @chat = Chat.find(params[:id])
    session[:chats].delete(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_chats
    session[:chats] ||= []
    session[:chats] << @chat.id
  end

  def chatted?
    session[:conversations]
  end
end
