# Coder: Rick Klein github.com/raklein
# Making a simple wordcloud of the Mueller report
# All credit to Alboukadel Kassambara, I'm implementing a simplified version of his tutorial: http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

library("pdftools") # to convert pdf to text
library("tm") # tools to work with text
library("wordcloud") # generate the wordcloud
library("RColorBrewer") # color palette 
library("Cairo") # antialiasing for better graphics

# Download report and place it in your directory. I sourced the report from https://cdn.cnn.com/cnn/2019/images/04/18/mueller-report-searchable.pdf.

# convert pdf to text
tex <- pdf_text("mueller-report-searchable.pdf")

# convert text to corpus so the tm package can work with it
docs <- Corpus(VectorSource(tex))

# "tidy up" the corpus and remove common words:

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))

# Remove numbers
docs <- tm_map(docs, removeNumbers)

# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))

# Specify any additional words you want removed
# Revisit this line after doing the visualization and add any extras
docs <- tm_map(docs, removeWords, c("president", "presidents", "also")) 

# Remove punctuations
docs <- tm_map(docs, removePunctuation)

# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

# There's a randomization component (mostly in terms of layout), so let's lock that randomization so we can reproduce the exact same figure if we want to
set.seed(1)

# Before making the figure, we're going to specify a graphics device to output to
# I'm using Cairo because it adds antialiasing for higher quality
CairoPNG("wordcloud.png", width = 450, height = 450)

# Make wordcloud
wordcloud(words = docs, 
                  scale=c(5,0.5), # size difference between largest and smallest words
                  min.freq = 1,
                  max.words = 150, # how many words to plot
                  random.order=FALSE, 
                  rot.per=0.35, # what % of words will be rotated
                  colors=brewer.pal(8, "Dark2")) # specify the color pallette

dev.off() # turn off the Cairo graphics device, which effectively saves the wordcloud as a .png
