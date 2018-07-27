require "nokogiri"
require "open-uri"
require "pry"

def create_project_hash
  binding.pry
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  #doc =  Nokogiri::HTML(open("https://www.imdb.com/chart/top"))
  #doc.css("a”)[0].attributes["href"].value

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
# <<<<<<< HEAD
#
# =======
#
# >>>>>>> 4992cb8a247bf9c937dffe8c9a0a588b6937ada9
#   projects
end

create_project_hash
