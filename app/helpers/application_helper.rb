module ApplicationHelper
	def count_answer(question_id)
		count = Answer.where(question_id: question_id).count
		#count = Answer.count
		if count > 0
			return count
		else
			return "未回答の質問"
		end
	end

	def check_username(user_id)
		username = User.find(user_id)

		if username.blank?
			default_username = "igo" + format("%05d", user_id)  
		else
			return username
		end
	end

	def set_default_name
		return "IGO"
	end

end
