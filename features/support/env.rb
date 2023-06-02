require 'httparty'
require 'faker'
require 'rspec'
require 'json'
require 'pry'

DATA = YAML.load_file('data/data.yaml')

$url = DATA['url']

