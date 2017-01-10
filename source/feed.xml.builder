# encoding: utf-8
xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "ryanfreeth.com"
  xml.subtitle "Ryan Freeth"
  xml.id "https://ryanfreeth.com/"
  xml.link "href" => "https://ryanfreeth.com/"
  xml.link "href" => "https://ryanfreeth.com/feed.xml", "rel" => "self"
  xml.updated blog("blog").articles.first.date.to_time.iso8601
  xml.author { xml.name "Ryan Freeth" }

  blog("blog").articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Ryan Freeth" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
