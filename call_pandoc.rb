#!/usr/bin/env ruby
require 'rake'
require 'open3'

## Define standard options
metadata_filename = "/Users/zvb1/.pandoc/defaults/user-metadata.yaml"

hash = {
    "syllabus_html" =>   ["-d refs -d scholar-html -d syllabus-html", "html"],
    "syllabus_pdf"  =>   ["-d refs -d syllabus-latex -d pdf-xelatex --quiet", "pdf"],
    "latex_html"    =>   ["sodifj", "html"]
}

## Match the hash key with the user input, to find the required set of options
options, extension = hash.fetch($*[0])

output_filename = File.join(File.dirname($*[1]), File.basename($*[1])).ext(extension)

## Construct command

command = "pandoc #{options} --metadata-file=#{metadata_filename} #{$*[1]} --output #{output_filename}"

## Run command
puts command

output = ""
error = ""
status = 0
Open3.popen3(command) do |stdin, stdout, stderr, thread|
    output << stdout.read
    error << stderr.read
    status = thread.value.exitstatus
end

## Parse output
if status==0
	puts output
	system %{open "#{output_filename}"}
else
	puts error
end
