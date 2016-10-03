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
