class EmotesController < ApplicationController
  require 'uri'

  def create
      emote = Emote.new(input: params[:emote])
      #emote.user = User.new
      emote.emotion = emote.retrieve_emotion
      emote.actions_array = emote.retrieve_actions
      suggestion = emote.actions_array.pop
      emote.save
      render json: { action: suggestion, emote_id: emote.id }
  end

  def show
    emote = Emote.find(params[:id])
    if emote.actions_array.empty?
      render json: { action: "whomp whomp" }
    else
      suggestion = emote.actions_array.pop
      emote.save
      render json: { action: suggestion, emote_id: emote.id }
    end
  end
end
