# 0x06. Regular expression

## Background Context

For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the //:

```
sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a
```

# Resources

**Read or watch:**

- [Regular expressions - basics](https://www.slideshare.net/neha_jain/introducing-regular-expressions)
- [Regular expressions - advanced](https://www.slideshare.net/neha_jain/advanced-regular-expressions-80296518)
- [Rubular is your best friend](https://rubular.com/)
- [Use a regular expression against a problem: now you have 2 problems](https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/)
- [Learn Regular Expressions with simple, interactive exercises](https://regexone.com/)

## Description

```
This project in the System engineering & DevOps Programming series is about:
* [Understanding regular expression and use cases](./regular_expression.pdf)


```

## General

- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- The first line of all your Bash scripts should be exactly #!/usr/bin/env ruby
- All your regex must be built for the Oniguruma library


## How it works
This project is built using Oniguruma to build regular expressions, a library used by Ruby by default and of course with Ruby language.

## How it compiles
No need to compile since it is all ruby scripts. Just make sure it is executable, if not use the "chmod u+x <file>" command



## Files
---
File|Task
---|---
```bash
.
├── 0-simply_match_school.rb
├── 100-textme.rb
├── 101-passed_linkedin_regex_challenge.jpg
├── 1-repetition_token_0.rb
├── 2-repetition_token_1.rb
├── 3-repetition_token_2.rb
├── 4-repetition_token_3.rb
├── 5-beginning_and_end.rb
├── 6-phone_number.rb
├── 7-OMG_WHY_ARE_YOU_SHOUTING.rb
├── regular_expression.pdf
└── README.md

0 directories, 11 files
```