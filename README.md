# shell_script

## Automated Readability Index Formula(ARIF)
Automated Readability Index (ARI)  calculates and determines the corresponding grade level for a given text file.ARI score is calculated based on the number of characters, words, and sentences in the text.It generates a score approximating the U.S. grade level and according to this grade level ARIF is calculated.

     Automated Readability Index formula(ARIF): 4.71 x (characters/words) + 0.5 x (words/sentences) – 21.43.

### Step-by-step implementation of ARI code involves:
1.Initially the script checks if a filename is provided as an argument.If no filename is provided, it returns a usage message and exits with code1.

2.Then calculating the word count, character count and sentence count using the below formulas:
                 
          > character_count is calculated using `wc -m`.

          > word_count counts the number of words using `wc -w`.

          >sentence_count counts the number of sentences by looking for punctuation marks (., !, ?) using grep and `wc -l `in which` grep -o '[.!?]`' "$file": This searches the file for occurrences of              the characters ., !, and ?, and -o ensures that only the matching characters are output.

3.Handle Zero Sentences:

    If sentence_count is zero, it sets sentence_count to 1 to avoid division by zero in the ARI calculation.

4.Calculating ARI using the above mentioned ARI formula and and` bc `for floating-point arithmetic.

5.Checking grade level based on the calculated ARI along with `| bc -l` and this pipes the arithmetic expression to bc with the` -l` option, to ensure math library is used for accurate floating-point arithmetic. 

### Problems occured while implementing the code and Soutions encountered for solving the errors:
Problem faced during the implementation is that after finding the char count, word count and sentence count this division by zero occured if the word count is zero, which leads to errors in the ARI calculation and by using `$word_count -eq 0` code the problem is resolved and also since bash cannot handle floating point values to resolve this problem ,used` bc `for floating point arithemetic comparison.

### References used for implementing the code:
For learning the basics of shell programming I have refered online tutorials like javatpoint and tutorialspoint along with waching youtube tutorials and also took some of the code from chatgpt for reference.

### Conclusion:
The Automated Readability Index (ARI) script provides an efficient solution for evaluating the readability of text files. By incorporating various Unix commands like grep, wc, and bc, the script accurately counts characters, words, and sentences, enabling the calculation of an ARI score indicative of the text's complexity.Along with this,the problem gives a platform to learn shell programming commands.These developments would further enhance the utility and accessibility of the ARI calculation tool, contributing to its effectiveness in assessing and enhancing the readability of written content.




          

