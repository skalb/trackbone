class Sampledata < ActiveRecord::Migration
  def up
  	project_id = feature_id = bug_id = 1
  	5.times do
  		project = Project.new(:name => "Project #{project_id  }")
  		project.save!
  		5.times do
  			feature = Feature.new(:name => "Feature #{feature_id}", :project_id => project.id)
  			feature.save!
  			5.times do
  				bug = Bug.new(:name => "Bug #{bug_id}", :feature_id => feature.id)
  				bug.save!
  				bug_id += 1
  			end
        feature_id += 1
  		end
      project_id += 1 
  	end
  end

  def down
  end
end
