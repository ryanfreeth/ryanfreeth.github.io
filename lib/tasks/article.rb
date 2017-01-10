namespace :article do
  task :new do
    title = ENV['TITLE'] || "New Article"
    slug  = title.downcase.gsub(/\s/, "-")
    file_name = File.join("source", "blog", Time.now.strftime("%Y-#{slug}.html.md"))
    touch file_name
    File.open(file_name, "w+") do |f|
      f.write <<-META
---
title: #{title}
author: Ryan Freeth
published: false
summary: #{title}
description: #{title}
pull_image: 'blog/stock/louvre-pexels-photo.jpg'
category: Code
tags:
  - Rails
---
META
    end
  end
end

desc "Generate new article"
task :article => ['article:new']
