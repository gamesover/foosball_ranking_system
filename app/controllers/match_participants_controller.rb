class MatchParticipantsController < ApplicationController
  before_action :set_match_participant, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @match_participants = MatchParticipant.select(:participant).distinct.map(&:participant)
  end

  def stat
    participants = params[:match_participant][:participants]

    if participants.count == 1
      redirect_to MatchParticipant.find_by(participant: participants.first)
    elsif participants.count == 2
      @first_participant = MatchParticipant.find_by(participant: participants.first)
      @second_participant = MatchParticipant.find_by(participant: participants.second)

      @result = @first_participant.versus(@second_participant)
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @match.match_participants.build
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_participant
      @match_participant = MatchParticipant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match_participant).permit(:participant, :team, :result)
    end
end
