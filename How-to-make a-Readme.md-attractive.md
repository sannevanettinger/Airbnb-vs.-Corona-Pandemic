*Sidenote: Open this README to see which codes can be used for a specific action.* 

----

# How to make a Readme.md attractive. Try using this codes
A readme is a description of your projects. You can add a README file to your repository to tell other people why your project is useful, what they can do with your project, and how they can use it.
(https://dev.to/silentlad/how-to-write-beautiful-and-meaningful-readme-md-jp3)(https://github.com/tchapi/markdown-cheatsheet/blob/master/README.md)

A README is often the first item a visitor will see when visiting your repository. README files typically include information on:
* What the project does
* Why the project is useful
* How users can get started with the project
* Where users can get help with your project
* Who maintains and contributes to the project


----
## 1. Adding headings to your Readme.md file
By using the codes below you will be able to add a heading of choice to your Readme.md file to make your Readme more attractive. 

# Heading 1
Markup :  # Heading 1 #

-OR-

Markup :  ============= (below H1 text)

## Heading 2
Markup :  ## Heading 2 ##

-OR-

Markup: --------------- (below H2 text)

### Heading 3
Markup :  ### Heading 3 ###

#### Heading 4
Markup :  #### Heading 4 ####

----

## 2. Making paragraphs in a Readme.md file: How to start a new sentence or paragraph
The easiest way is to ensure that each lin ends with two spaces, for example:  
A  
B  
C  

It can also be done by adding this (<br />) tag.  
A <br />
B <br />
C <br />

----

## 3. Emphasizing text in a Readme.md file
Emphasis (schuingedrukt), aka italics, with _underscores_ before and after the word that should be emphasized.  
Strong emphasis (dikgedrukt), aka bold, with **stars** before and after the word that should be emphasized.  
Combined emphasis (schuingedrukt en dikgedrukt), with **stars and _underscores_**.  
Strikethrough uses two tildes. ~~Scratch this.~~

----

## 4. Adding listings to your Readme.md file
This will create a number list in your Markdown file. 
1. Numbered list item A
2. Numbered list item B
3. Numbered list item C

This will create a bullet point list in your Markdown file.
* Bullet list item 1
* Bullet list item 2
* Bullet list item 3


----

## 5. Adding tables to your Readme.md file
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

Left aligned Header | Right aligned Header | Center aligned Header
| :--- | ---: | :---:
Content Cell  | Content Cell | Content Cell
Content Cell  | Content Cell | Content Cell

----

## 6. Adding images to your Readme.md file
Upload your image in a special folder at the repositiry, and then link the filename like this:  
-![Screenshot](docs/images/screenshot.png)-

----

## 7. The use of relative links and image paths in README files
You can define relative links and image paths in your rendered files to help readers navigate to other files in your repository.

A relative link is a link that is relative to the current file. For example, if you have a README file in root of your repository, and you have another file in docs/CONTRIBUTING.md, the relative link to CONTRIBUTING.md in your README might look like this:

[Contribution guidelines for this project](docs/CONTRIBUTING.md)
GitHub will automatically transform your relative link or image path based on whatever branch you're currently on, so that the link or path always works. You can use all relative link operands, such as ./ and ../.

Relative links are easier for users who clone your repository. Absolute links may not work in clones of your repository - we recommend using relative links to refer to other files within your repository.

----

## 8. Adding emoticons to your Readme.md file
Try using this link (https://www.webfx.com/tools/emoji-cheat-sheet/)  
:sunglasses:

