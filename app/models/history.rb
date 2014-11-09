class History < ActiveRecord::Base
  belongs_to :publication, foreign_key: "publication_id"
  has_many :publications_and_histories

  def self.publications_from_history(history)
	p_and_h= PublicationsAndHistory.find_all_by_history_id history.id
    publications = Array.new()
    publications.push(Publication.find_by_id p_and_h[0].llink_id)
    p_and_h.each do |publ|
      publications.push(Publication.find_by_id publ.publication_id)
    end
    return publications
  end

  def self.histories_without_publication(publication_id)
  	histories = Array.new()
    histories_to_exclude = Array.new()
    p_and_h= PublicationsAndHistory.find_all_by_publication_id publication_id
    p_and_h.each do |post|
      if(!histories_to_exclude.include? post.history.id)
        histories_to_exclude.push(post.history.id)
      end
    end

    histories=History.where("id NOT IN (?)", histories_to_exclude)
    return histories

  end

  def self.histories_with_publication(publication_id)
    histories_to_include = Array.new()
    p_and_h = PublicationsAndHistory.where("publication_id = ? OR llink_id = ? OR rlink_id = ?","#{publication_id}","#{publication_id}","#{publication_id}")
    p_and_h.each do |post|
      if(!histories_to_include.include? post.history)
        histories_to_include.push(post.history)
      end
    end
    return histories_to_include
    
  end

end
