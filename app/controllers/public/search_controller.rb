class Public::SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    if @content == ""
      redirect_to public_posts_path
    else
      @records = search_for(@model, @content)
    end
  end

  private

  def search_for(model, content)
    if model == "post"
      Post.joins(:dog).where('name LIKE ? OR title LIKE ?', "%#{content}%", "%#{content}%").page(params[:page]).order('created_at DESC').per(8)
    elsif model == "tag"
      Post.tagged_with(content).page(params[:page]).order('created_at DESC').per(8)
    else model == "dog"
         dog_list = Dog.joins(:dog_breed).where('dog_breeds.name LIKE ?', "%#{content}%")
         Post.where(dog_id: dog_list.ids).page(params[:page]).order('created_at DESC').per(8)
    end
  end
end
