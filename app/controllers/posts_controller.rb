class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], content: params[:content], deadline: params[:deadline])

    @post.save!
    redirect_to("/posts/index", success: "postが投稿されました。")
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:danger] = "postが投稿されませんでした。"
    render("posts/new")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.deadline = params[:deadline]

    @post.save!
    redirect_to("/posts/index", success: "postが更新されました。")
  rescue ActiveRecord::RecordInvalid => e
    render("posts/edit")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index", warning: "postが削除されました。")
  end

  def date_params
    params.require(:post).permit(:date)
  end


end
