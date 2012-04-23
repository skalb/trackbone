class Sampledata < ActiveRecord::Migration
  def up
  	project_id = feature_id = bug_id = 1
  	5.times do
  		project = Project.new(:name => "Project #{p}")
  		project.save!
  		project_id += 1 
  		5.times do
  			feature = Feature.new(:name => "Feature #{feature_id}", :project_id => project.id)
  			feature.save!
  			feature_id += 1
  			5.times do
				bug = Bug.new(:name => "Bug #{bug_id}", :feature_id => feature.id)
  				bug.save!
  				bug_id += 1
  			end
  		end
  	end
  end

  def down
  end
end
