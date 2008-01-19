xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Marten Veldthuis")
    xml.link("http://marten.veldthuis.com/posts.rss")
    xml.description("Photography, design, code. Musings of a creative developer.")
    xml.language('en-us')

    for post in @posts
      xml.item do
        xml.title(post.title)
        xml.category()
        xml.description( render(:partial => "comments/post", :locals => {:post => post}) )
        xml.pubDate(post.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
        xml.link(post_url(post))
        xml.guid(post_url(post))
      end
    end
  }
}
