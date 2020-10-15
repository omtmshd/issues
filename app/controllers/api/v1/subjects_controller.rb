class Api::V1::SubjectsController < ApplicationController
  def index
    render json: Subject.includes(:lectures, :teacher).order("lectures.date").keyword_search(params[:keyword]).teacher_search(params[:teacher_name]).to_json(
      only: %i[id title weekday period],
      include: [
        teacher: {
          only: %i[id name]
        },
        lectures: {
          only: %i[id title date]
        }
      ]
    )
  end
end
