-- vowels_and_consonants.ex

constant VOWELS = "aeiouAEIOU"

function vowels(sequence str)
    integer v = 0, vd = 0, c = 0, cd = 0
    sequence vs = "", cs = ""
    for i = 1 to length(str) do
        integer j = str[i]
        if find(j,VOWELS) then
            if not find(j,vs) then vs &= j vd += 1
            end if
            v += 1
        else
            if not find(j,cs) then cs &= j cd += 1
            end if
            c += 1   
        end if
    end for
    return {v,vd,c,cd}
end function

constant test = "Now is the time for all good men to come to the aid of their country."
sequence s = vowels(test)
printf(1, "In '%s'", {test})
printf(1, "There are %d vowels,",s[1])
printf(1," of which %d are distinct.\n",s[2])
printf(1, "There are %d consonants,",s[3])
printf(1," of which %d are distinct.\n",s[4])
