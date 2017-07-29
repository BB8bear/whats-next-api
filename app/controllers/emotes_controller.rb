class EmotesController < ApplicationController
    require 'uri'

    def create
        emote = Emote.new(input: params[:content])
        emote.recommendation = emote.retrieve_action
        emote.save
        render json: { action: emote.recommendation.action.content }
    end
end
