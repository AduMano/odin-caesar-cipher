# CAESAR CIPHER - RUBY BASICS | THE ODIN PROJECT 

Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

```Ruby
  > caesar_cipher("What a string!", 5)
  => "Bmfy f xywnsl!"
```

Quick Tips:

    You will need to remember how to convert a string into a number.
    Don’t forget to wrap from z to a.
    Don’t forget to keep the same case.


## USAGE
> Call method caesar_cipher (text: string, shift: number )

> What to pass on the arguments:
  - string = This is where you want your message or string to be ciphered. Ex: "Hello"
  - shift = This is where you put a number depending on how much you wanted to shift the characters
    
    > **NOTE**
    >
    > - You are able to enter negative shift value, which will make the shifting go to left instead of right.
    > - So positive value results to shifting to right, while negative shifts to left.
    > - If you leave the shift empty, thats okay, the default value of that is 1, which shifts all characters in the string to the right by one



## TEST RESULTS
```Ruby
  puts caesar_cipher("What a string!", 5) # => "Bmfy f xywnsl!"
  puts caesar_cipher("What a string!", -5) # => "Rcvo v nomdib!"
  puts caesar_cipher("TOP is the Best!!!", 502) # => "BWX qa bpm Jmab!!!"
  puts caesar_cipher("BWX qa bpm Jmab!!!", -502) # => "TOP is the Best!!!"
  puts caesar_cipher("No ShIfT?!") # => "Op TiJgU?!"
```