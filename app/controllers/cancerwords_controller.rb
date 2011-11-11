class CancerwordsController < ApplicationController
  # GET /cancerwords
  # GET /cancerwords.xml
  def index
    @cancerwords = Cancerword.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cancerwords }
    end
  end

  # GET /cancerwords/1
  # GET /cancerwords/1.xml
  def show
    @cancerword = Cancerword.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cancerword }
    end
  end

  # GET /cancerwords/new
  # GET /cancerwords/new.xml
  def new
    @cancerword = Cancerword.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cancerword }
    end
  end

  # GET /cancerwords/1/edit
  def edit
    @cancerword = Cancerword.find(params[:id])
  end

  # POST /cancerwords
  # POST /cancerwords.xml
  def create
    @cancerword = Cancerword.new(params[:cancerword])

    respond_to do |format|
      if @cancerword.save
        format.html { redirect_to(@cancerword, :notice => 'Cancerword was successfully created.') }
        format.xml  { render :xml => @cancerword, :status => :created, :location => @cancerword }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cancerword.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cancerwords/1
  # PUT /cancerwords/1.xml
  def update
    @cancerword = Cancerword.find(params[:id])

    respond_to do |format|
      if @cancerword.update_attributes(params[:cancerword])
        format.html { redirect_to(@cancerword, :notice => 'Cancerword was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cancerword.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cancerwords/1
  # DELETE /cancerwords/1.xml
  def destroy
    @cancerword = Cancerword.find(params[:id])
    @cancerword.destroy

    respond_to do |format|
      format.html { redirect_to(cancerwords_url) }
      format.xml  { head :ok }
    end
  end
end
