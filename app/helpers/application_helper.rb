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
end
