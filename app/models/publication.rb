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

def self.checkNewHistory(history_id,llink)
  if(history_id == "-1")
    return true
  else
    @p_and_h= PublicationsAndHistory.where("history_id = #{history_id} AND publication_id = #{llink}")
    @p_and_h.each do |publ|
      if publ.rlink_id != nil
        return true
      end
    end
    return false
  end
end

def self.delete_from_p_h(publication)
  if(!publication.singularity)
    @p_and_h = PublicationsAndHistory.find_all_by_publication_id publication.id
    @p_and_h.each do |publ|
      publication = Publication.find_by_id publ.publication_id
        if(!publ.rlink_id.nil?)
          temp_llink = PublicationsAndHistory.where("history_id = ? AND publication_id = ?","#{publ.history_id}","#{publ.llink_id}")
          temp_rlink = PublicationsAndHistory.where("history_id = ? AND publication_id = ?","#{publ.history_id}","#{publ.rlink_id}")
          temp_llink[0].rlink_id = publ.rlink_id
          temp_rlink[0].llink_id = publ.llink_id
          temp_llink[0].save
          temp_rlink[0].save
          PublicationsAndHistory.delete(publ.id)
        else
          temp_llink = PublicationsAndHistory.where("history_id = ? AND publication_id = ?","#{publ.history_id}","#{publ.llink_id}")
          temp_llink[0].rlink_id =nil
          temp_llink[0].save
          PublicationsAndHistory.delete(publ.id)
        end
      end
  else
    #si borra singularidad borra todas las historias asociadas y todas las historia-publicacion
    PublicationsAndHistory.delete_all(["llink_id = ? OR publication_id = ?","#{publication.id}","#{publication.id}"])
    History.delete_all(["publication_id = ?", "#{publication.id}"])
  end
end

def stories_which_belongs
 PublicationsAndHistory.where("publication_id = #{self.id}")
end



def self.create_publications_and_histories(history_id,llink,publication_id,history_name)
  inHistory = 0
  if(history_id == "-1")
    @n_history= History.new
    @n_history.title = history_name
    @n_history.publication_id = llink
    @n_history.save
    @n_ph = PublicationsAndHistory.new
    @n_ph.publication_id = llink
    @n_ph.history_id = @n_history.id
    @n_ph2 = PublicationsAndHistory.new
    @n_ph2.llink_id = llink
    @n_ph2.publication_id = publication_id
    @n_ph2.history_id = @n_history.id
    @n_ph.rlink_id=publication_id
    @n_ph.save
    @n_ph2.save
    inHistory = @n_history.id
  else
    @p_and_h= PublicationsAndHistory.where("history_id = #{history_id} AND publication_id = #{llink}")
    @p_and_h.each do |publ|
      if publ.rlink_id == nil
        publ.rlink_id = publication_id
        publ.save
        @n_ph = PublicationsAndHistory.new
        @n_ph.llink_id = llink
        @n_ph.publication_id = publication_id
        @n_ph.history_id = history_id
        inHistory = history_id
        @n_ph.save
      else
        puts "its not nill i must create a new history omg with publication #{publication_id}"
        @n_history= History.new
        @n_history.title = history_name
        @temp_history = History.find(history_id)
        @n_history.publication_id = @temp_history.publication_id
        @n_history.save
        inHistory = @n_history.id
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
  return inHistory
end

end
