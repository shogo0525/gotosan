module ApplicationHelper

  def profile_img(user)
    size = "50x50"
    return image_tag(user.avatar, size: size, alt: user.name) if user.avatar?

    #unless user.provider.blank?
    #  img_url = user.image_url
    #else
    #  img_url = 'no_image.png'
    #end
    img_url = 'no_image.png'
    image_tag(img_url, size: size, alt: user.name)

  end

	def count_answer(question_id)
		count = Answer.where(question_id: question_id).count
		#count = Answer.count
		if count > 0
			return count
		else
			return "未回答の質問"
		end
	end

	def get_tag_list
		tags = ["布石", "定石", "ヨセ", "手筋"]
	end

	def get_user_name(question)
		if question.anonym == true
			return "ユーザー名非公開"
		else
			return question.user.name
		end
	end

end
