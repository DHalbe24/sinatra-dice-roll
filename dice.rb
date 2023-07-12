require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do
  "<h1>Dice Roll</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die6 = rand(1..6)
  second_die6 = rand(1..6)
  sum6 = first_die6 + second_die6
	
  outcome6 = "You rolled a #{first_die6} and a #{second_die6} for a total of #{sum6}."
	
   "<h1>2d6</h1>
   <p>#{outcome6}</p>"
end

get("/dice/2/10") do
  first_die10 = rand(1..10)
  second_die10 = rand(1..10)
  sum10 = first_die10 + second_die10

  outcome10 = "You rolled a(n) #{first_die10} and a(n) #{second_die10} for a total of #{sum10}."

  "<h1>2d10</h1>
  <p>#{outcome10}</p>"
end

get("/dice/1/20") do
  die20 = rand(1..20)

  outcome20 = "You rolled a(n) #{die20}."

  "<h1>1d20</h1>
  <p>#{outcome20}</p>"
end

get("/dice/5/4") do
  first_die4 = rand(1..4)
  second_die4 = rand(1..4)
  thrid_die4 = rand(1..4)
  fourth_die4 = rand(1..4)
  fifth_die4 = rand(1..4)

  sum4 = first_die4 + second_die4 + thrid_die4 + fourth_die4 + fifth_die4

  outcome4 = "You rolled a #{first_die4}, a #{second_die4}, a #{thrid_die4}, a #{fourth_die4}, and a #{fifth_die4} for a total of #{sum4}"

  "<h1>5d4</h1>
  <p>#{outcome4}</p>"
end
