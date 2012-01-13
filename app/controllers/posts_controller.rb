require 'extract_items.rb'
require 'cancerwords_controller.rb'
require 'open-uri'

class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    #@posts = Post.all
	@posts = Post.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  def testadd
    @post = Post.new(
	  :title => 'testadd', 
	  :link => 'testadd.com',
	  :author => 'a',
	  :description => 'd',
	  :date => DateTime.new(2011, 10, 2)
	  )
	@post.save
	
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  # extracting begin =============>
  def extract
    filepath = 'http://www.tianya.cn/new/techforum/ArticlesList.asp?pageno=1&iditem=100&part=0&subitem=%D6%D7%C1%F6%BF%C6'
    method = 'tianya_forum';
    p "import #{filepath} ......"
    content = open(filepath).read
    items = extract_items(content, method)
    ignored_count = 0; imported_count = 0;
    items.each do |item|
	  if !Post.where(:link => item.link).empty?; ignored_count = ignored_count+1; next; end
      p = Post.new(
        :title => item.title, 
        :link => item.link,
	    :author => item.author,
	    :description => item.description,
	    :date => item.date,
	    :source => item.source
	  )
	  p.save
	  imported_count = imported_count + 1;
    end
    p "imported #{imported_count} items; ignored #{ignored_count} items"
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  # extracting end =============>
  
  def update_words_count
    @words = Cancerword.all
	@words.each { |word|
	  word.count = Post.where("title like ?", "%#{word.name}%").size
	  word.save
	}
  end
  
  # search
  def s
    update_words_count
    @words = Cancerword.find(:all, :order=>'count DESC')
    q = "%#{params[:key]}%"
    #@posts = Post.where("title like ?", q).paginate(:page => params[:page])
    #@posts = Post.order("date ASC").where("title like ?", q).paginate(:page => params[:page])
	#@posts = Post.where("title like ?", q).paginate(:page => params[:page], :order=>"date DESC")
	@posts = Post.find(:all, :conditions => ["title like ?", q], :order =>"date DESC").paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
