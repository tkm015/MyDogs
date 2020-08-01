class Public::SearchController < ApplicationController
  def search
  	@model = params["search"]["model"]
  	@content = params["search"]["content"]
  	@records = search_for(@model, @content)
  end

  private
  def search_for(model,content)
  	if model == "post"
  		Post.joins(:dog).where('name LIKE ? OR title LIKE ?', "%#{content}%", "%#{content}%" )
  	elsif model == "tag"
  		Post.tagged_with(content)
  	else model == "dog"
  		dog_list = Dog.joins(:dog_breed).where('dog_breeds.name LIKE ?', "%#{content}%")
  		Post.where(dog_id: dog_list.ids)
    end
  end
end
