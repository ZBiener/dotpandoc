#!/usr/bin/env ruby
#encoding: utf-8

# This tweaks several parts of the Pandoc LaTeX output
# VERSION: 1.0.3

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

output = $stdin.read

# make horizontal rules in tables italicised
output.gsub!(/\\tabularnewline/, '\tabularnewline\addlinespace[.6ex]\cmidrule(r{10pt}){2-3}\addlinespace[.6ex]')

puts output
