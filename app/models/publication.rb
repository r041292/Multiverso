class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :histories, foreign_key: "publication_id"
  has_many :publications_and_histories
  self.inheritance_column = nil


 before_save do
  if self.type == 2
    if self.url.match(/\b658px\b/)
      self.url["658"]="300"
    end
  end
  if self.type==3
    if self.url.match(/\b600\b/) 
      self.url["600"]= "300"
      self.url["600"]= "300"
    end
    if self.url.match(/\b480\b/)
      self.url["480"]= "300"
      self.url["480"]= "300"
    end
    if self.url.match(/\b320\b/)
      self.url["320"]= "300"
      self.url["320"]= "300"
    end
  end
end

  def self.create_publications_and_histories(history_id,llink,publication_id)

  	@p_and_h= PublicationsAndHistory.where("history_id = #{history_id} AND publication_id = #{llink}")
  	@p_and_h.each do |publ|
  		if publ.rlink_id == nil
  			publ.rlink_id = publication_id
  			publ.save
  			@n_ph = PublicationsAndHistory.new
  			@n_ph.llink_id = llink
  			@n_ph.publication_id = publication_id
  			@n_ph.history_id = history_id
  			@n_ph.save
  		else
  			puts "its not nill i must create a new history omg with publication #{publication_id}"
  			@n_history= History.new
  			@temp_history = History.find(history_id)
  			@n_history.publication_id = @temp_history.publication_id
  			@n_history.save
  			@n_ph= PublicationsAndHistory.where("history_id = #{history_id}")
  			@n_ph.each do |posts|
  			@temp_ph = PublicationsAndHistory.new
  			@temp_ph.history_id = @n_history.id
  				if(posts.publication_id == Integer(llink))
  					@temp_ph.llink_id = posts.llink_id
  					@temp_ph.publication_id = posts.publication_id
  					@temp_ph.rlink_id = publication_id
  					@temp_ph.save
  					@temp_ph = PublicationsAndHistory.new
  					@temp_ph.llink_id = llink
  					@temp_ph.publication_id = publication_id
  					@temp_ph.history_id = @n_history.id
  					@temp_ph.save
  					break
  				else
  					@temp_ph.rlink_id = posts.rlink_id
  					@temp_ph.llink_id = posts.llink_id
  					@temp_ph.publication_id = posts.publication_id
  					@temp_ph.save
  				end
  			end
  		end
  	end
  end
end
