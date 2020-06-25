# frozen_string_literal: false
require 'fileutils'
dir = Dir.new('.')
folders = dir.entries
folders.delete_if { |e| e.match(/^\.+$/) || e.match(/\.ogg/) || e.match(/\.rb/)}
folders.sort!
p folders

#d1 = Dir.new(folders).entries.sort.delete_if { |e| e.match(/^\.+$/) || e.match(/\.ogg/) }
#p d1
#p d1


count = 1


system 'cls'
folders.each do |folder|
  p folders
  #p folder
  names = []
  puts "line 22"
  p Dir.pwd
  current_dir = Dir.new(folder)
  p current_dir
  Dir.chdir(current_dir)
  entries = Dir.each_child(Dir.pwd).sort
  # Dir.each_child.sort(Dir.pwd) do |fn|
  #   puts fn
  # end
  entries.each do |fn|
    file_prefix = format("%02d", count)
    file_name = fn
    unless fn.match(/^\d+/).to_s == file_prefix
      file_name = file_prefix + '.' + fn.match(/[a-zA-Z]+.*/).to_s
      File.rename(fn, file_name)
    end
   # p Dir.pwd + '.' + file_name
   # p Dir.pwd + '/' + file_name
    #names << file_name
    count += 1
    original_location = Dir.pwd + '/' + file_name
   # Dir.chdir('..')
    new_location = Dir.pwd + '/..' 
    FileUtils.mv(original_location, new_location)
   
  end
  puts "line 45"
  p (Dir.pwd)
  Dir.chdir(Dir.new((Dir.pwd) +'/..'))
  #puts names
end