class ChatsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @chat = current_user.chats.build(params[:chat])
    Pusher['presence-channel'].trigger('my-event', {:message => @chat.content, :name => current_user.email})
    @chat.save!
    render :json => @chat
  end

  def index
    @chats = Chat.where(created_at: (current_user.current_sign_in_at..Time.now))
  end

end
