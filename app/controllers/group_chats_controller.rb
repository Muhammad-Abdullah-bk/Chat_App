class GroupChatsController < ApplicationController

  def new
    @group_chat = GroupChat.new
  end

  def create
    new_group_chat = GroupChat.create(group_chat_params)
    if new_group_chat.save!
      redirect_to home_path
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  private

  def group_chat_params
    params.require(:group_chat).permit(:name)
  end
end
