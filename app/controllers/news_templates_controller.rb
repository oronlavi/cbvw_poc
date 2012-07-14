class NewsTemplatesController < ApplicationController
  # GET /news_templates
  # GET /news_templates.json
  def index
    @news_templates = NewsTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_templates }
    end
  end

  # GET /news_templates/1
  # GET /news_templates/1.json
  def show
    @news_template = NewsTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news_template }
    end
  end

  # GET /news_templates/new
  # GET /news_templates/new.json
  def new
    @news_template = NewsTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news_template }
    end
  end

  # GET /news_templates/1/edit
  def edit
    @news_template = NewsTemplate.find(params[:id])
  end

  # POST /news_templates
  # POST /news_templates.json
  def create
    @news_template = NewsTemplate.new(params[:news_template])

    respond_to do |format|
      if @news_template.save
        format.html { redirect_to @news_template, notice: 'News template was successfully created.' }
        format.json { render json: @news_template, status: :created, location: @news_template }
      else
        format.html { render action: "new" }
        format.json { render json: @news_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news_templates/1
  # PUT /news_templates/1.json
  def update
    @news_template = NewsTemplate.find(params[:id])

    respond_to do |format|
      if @news_template.update_attributes(params[:news_template])
        format.html { redirect_to @news_template, notice: 'News template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_templates/1
  # DELETE /news_templates/1.json
  def destroy
    @news_template = NewsTemplate.find(params[:id])
    @news_template.destroy

    respond_to do |format|
      format.html { redirect_to news_templates_url }
      format.json { head :no_content }
    end
  end
end
