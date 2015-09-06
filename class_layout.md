# Class hierarchy

## Chisel

### Responsibilities:  

* Read markdown file in
* Sends string to block
* Receives block array from block
* Sends block array to inline for evaluation
* Joins block array from inline into one string
* Handles the HTML, HEAD and BODY tags
* Handles the HTML, HEAD and BODY tags
* Write html file output


### Children

* Block
* Inline

## Block

### Responsibilities

* Split input into array by \n\n
* For each element (in block) -
  * Determines type of block type
* Delegates parsing of "sub-block" to Inline
* Returns a parsed block item to Chisel

## Children

* Heading
* List
  * OrderedList
  * UnorderedList
* Paragraph

## Inline

### Responsibilities

* Determines the type(s) of inline
* Changes block array based on inline type(s)
* Returns block array to Chisel
