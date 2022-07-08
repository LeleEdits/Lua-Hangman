
function main ()

	local phrase, lives, aux
	local ending = false
	local fin = false
	local auxPhrase
	local said = ""
	print("Enter a word or phrase to begin (this game is not key sensitive):")
	phrase = io.read("*l")
	auxPhrase = phrase:upper()
	print("Enter maximum lives:")
	lives = io.read("*n")
	print("*l")
	
	aux =phrase:len()
	
	local k
	for k=1, phrase:len() do
		local x = phrase:sub(k,k)
		if x == " " or x == "'" then
			aux = aux - 1
		end
	end
	
	for i=0, 15 do
		print("\n")
	end	
	
	print("This is hangman game. You have to figure out the word by typing letters.")
	print("You have a maximum of " .. lives .. " lives to solve the word and winning te game.")
	print("Let's get started!!\n")
	print("the word has " .. aux .. " letters.\n")
		
	local letter
	local i, j
	local build = {phrase:len()}
		
	for i=1, phrase:len() do
		local x = phrase:sub(i,i)
		if x == " " then
			build[i] = " "
		elseif x == "'" then
			build[i] = "'"
		else
			build[i] = "_"
		end
	end
	
	while not ending do
		fin = false
		print("Enter a letter, please: ")
		letter = io.read("*l")
		letter = letter:upper()
		
		while true do 
			while letter:len() ~= 1 or letter == " " do
				print("ERROR!! EnterJUST one letter (no blanks or repeat letters), please: ")
				letter = io.read("*l")
				letter = letter:upper()
			end

			while not fin do
				if said:len() ~= 0 then
					for i = 1, said:len() do
						local s = said:sub(i,i)
						s = s:upper();
						
						if s == letter then
							print("ERROR!! EnterJUST one letter (no blanks or repeat letters), please: ")
							letter = io.read( "*l" )
							letter = letter:upper()
							break
						elseif i == said:len() then
							fin = true;
						end
					end
				else 
					print("show this ELSE")
					fin = true
				end
			end
			if fin then
				break;
			end
		end
		
		j = 0 
			

		for i = 1, phrase:len() do  
			local c = auxPhrase:sub(i,i)
			if c == letter then
				said = said .. letter
				build[i] = letter
				aux = aux - 1
				j = j + 1;
			end
		end
		
		for i = 1, phrase:len() do
			io.write(build[i])
		end
		print("\n")
		print("\n\n")
		
		if j == 0 then
			lives = lives - 1
			print("There is no " .. letter .. " in the word. You lost one live!")
			print(lives .. " live(s) left\n")
			if lives == 0 then
				ending = true
			end
		end
		if aux > 0 then
			print("There are " .. aux .. " letters left\n")
		else
			ending = true
		end
	end

	if lives == 0 then
		print("SORRY!! you lost the game!")
		print("the word was " .. auxPhrase)
	else 
		print("YAI!! CONGRATULATIONS!! YOU WON!!")
		print("YAI!! CONGRATULATIONS!! YOU WON!!")
		print("YAI!! CONGRATULATIONS!! YOU WON!!")
		print("The word was " .. auxPhrase )
	end
end

main()