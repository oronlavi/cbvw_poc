class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    creation_params = params[:match].dup
    homeuser = User.find_by_fifa_username(creation_params[:home_fifa_username].downcase)
    awayuser = User.find_by_fifa_username(creation_params[:away_fifa_username].downcase)
    creation_params[:homeuser_id] = 3
    creation_params[:awayuser_id] = 3

    if homeuser then
      creation_params[:homeuser_id] = homeuser.id
    end
    if awayuser then
      creation_params[:awayuser_id] = awayuser.id
    end
    creation_params.except!(:home_fifa_username)
    creation_params.except!(:away_fifa_username)

    @match = Match.new(creation_params)


    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])

    params[:match].except!(:home_fifa_username)
    params[:match].except!(:away_fifa_username)

    respond_to do |format|
      if @match.update_attributes(params[:match])
        if @match.ended then
          if @match.homegoals > @match.awaygoals then
            template = NewsTemplate.find_all_by_news_type(NewsTemplate::NewsTypes::HomeSmallWin).shuffle.first
          else
            template = NewsTemplate.find_all_by_news_type(NewsTemplate::NewsTypes::AwayBigWin).shuffle.first
          end
          NewsItem.create({:match_id => params[:id], :news_template_id => template.id})
        end
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end
end
