# GET ALL FILES FORMAT .hmtl IN THIS FOLDER TO ARRAY
filenames = Dir.glob "*.html"

#LOOPING TO MODIFIED
filenames.each_with_index do |file, index|
  # GET PATH LOCATION FILE
  path = File.absolute_path(file)

  # READ AND CHANGE TEXT ADD PARAMETER WITH GSUB (Many Condition Text)
  r = File.read(path)
  new_contents = r.gsub('?id', '?partner=widgetco&id')
  new_contents = new_contents.gsub('test/">', 'test?partner=widgetco">')
  new_contents = new_contents.gsub('jsp">', 'jsp?partner=widgetco">')
  new_contents = new_contents.gsub('space_rocket"', 'space_rocket?partner=widgetco"')
  new_contents = new_contents.gsub('/">', '?partner=widgetco">')

  # REWRITE FILE TO NEW CONTENTS 
  f = File.open(path, "w")
  f.write(new_contents)
  f.close

  # MESSAGE COMPILE SUCCESS
  puts "File #{index+1} (#{file}) Successfully modified add parameter 'partner' with the value of 'widgetco'"
end