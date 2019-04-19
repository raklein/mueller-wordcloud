# mueller-wordcloud

Makes a simple word cloud from the Mueller report. Credit to [Alboukadel Kassambara](https://github.com/kassambara), I'm implementing a simplified version of his tutorial: http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

![Word cloud](wordcloud.png?raw=true "Title")

# To reproduce:
- Download or .zip or clone the repository
- Open the .rproj file (if you have R Studio) or just the .r script if you just have base R
- Download the [Mueller report .pdf](https://cdn.cnn.com/cnn/2019/images/04/18/mueller-report-searchable.pdf) and place it in the directory
- Install required libraries: pdftools, tm, wordcloud, RColorBrewer, Cairo.
- Ensure you've set the directory as the working directory if you're not using the .rproj file
- Script should run
