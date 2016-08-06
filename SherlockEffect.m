function []=SherlockEffect(word)

% word='MONKEYS CAN WRITE HAMLET'; %give a word or a sentence to match
alphabet=['a':'z','A':'Z',num2str(0:9),' ']; %define the English alphabet and add numbers
alphabet=[alphabet(alphabet~=' '),' ']; %get rid of extra spaces, add just 1 space to capture word spacing in sentences

r=randi(length(alphabet),1,length(word)); %pick random numbers between 1-63 (26 uppercase letters + 26 lowercase letters + 10 numbers + 1 space) for each letter
randword=alphabet(r); %pick random characters from the alphabet
check=word==randword; %check if they match and create a check matrix

foundword=zeros(length(word)); %initialize foundword for speed

while ~all(check) %as long as there are letters that did not match
    check=word==randword; %check if they match and create a check matrix
    pos=find(check==1); %get the positions of the matching characters
    
    foundword(pos)=word(pos); %create a foundword array with the correct values
    
    r=randi(length(alphabet),1,length(word)); %pick random numbers between 1-37 (26 uppercase letters + 26 lowercase letters + 10 numbers + 1 space) for each letter
    randword=alphabet(r); %pick random characters from the alphabet
    
    randword(pos)=foundword(pos); %replace the random letters with previously found once to prevent overwriting
    
    fprintf('%s\n',randword) %print the current estimation
    pause(0.05) %pause a bit to show humans
    clc %clear the command window for a nice effect
end
fprintf('%s\n',randword) %print the final word
fprintf('Code terminated.\n') %termination message
end