class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.page(params[:page])
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
    @game.game_detail = GameDetail.new
    @game.game_images = []
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        build_game_images
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        build_game_images
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
      @game.game_detail ||= GameDetail.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :size, :gametype, :icon, :picture,
                                   :content, :createtime, :updatetime, :company_id,
                                   :version, :state, :need_internet, :need_google,
                                   :free, :need_vpn, :Chinese, :download_url, :download_url_second,
                                   :download_url_share, :share_url_pwd,
                                   game_detail_attributes:
                                       [:editor, :editor_pic, :content, :crack_info, :test_cellphone_list, :comefrom, :game_id, :id]
                                  )
    end

    def build_game_images
      if params[:game_images]
        params[:game_images].each { |image|
          @game.game_images.create(picture: image, game_id: @game.id)
        }
      end
    end

end
