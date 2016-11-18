class Api::V1::GamesController < Api::BaseController
  # respond_to :json
  # def show
  #   @game = Game.find params[:id]
  #   respond_with(@game)
  # end

  def create
    a = DataApiJob.perform_later params
    render json: {job_id: a.job_id}
  end

end


# product,vendor,build_version,build_date