require 'hpricot'
require 'ostruct'

def extract_tianya_items(content)

  doc = Hpricot(content)
  elements = doc.search("div.listbox")
  puts "#{elements.size} results:"
  elements.collect do |e|
    link = e.at("h3").at("a")
    related = e.search("p.related")
    text = related.inner_html
    OpenStruct.new( {
      'title' => (link/'//text()').join(''),
      'link'  => link['href'],
      'author' => related.at('a').inner_html,
      #'date'  => text[(ind + 6) .. (ind + 21)],
      'description' => e.at('p.summary').inner_html
  })
  end

end

#content = open('tianya.htm').read
#items = extract_tianya_items(content)
#p items.join('-')
