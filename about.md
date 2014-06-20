## About the study notebook

### Background

In going through Coursera's Data Science curriculum, I found myself really wanting to be able to take notes that would bring together the concepts and code so that I could easily go back and look up terms.

Normally, I can just write up notes in a text editor, but the mathematical functions made this harder for me to do. I use emacs, which has Latex modes, but I could never get any to work. RStudio allows Rmd files, but that tied up the app while I was trying to use it for other purposes.

When the Shiny project was assigned in the Developing Data Products course, it seemed like a good way to pull all my notes together, with the math and the code and potentially even some of the plot outputs.

### Application Interface

The application is set up very simply. The _Topic_ selection box is loaded from a csv file (topics.csv) on the server. Each line consists of the topic name (displayed in the selection box) and the name of the markdown file containing the notes.

### Apps
In addition to a writeup, I thought it would sometimes be useful to have a demonstration of using the code. This can appear in the "Sample App" tab, although most topics probably won't get an app actually written. In this first demonstration of the Study notebook, I have just implemented 1 app (latex) and ported over a sample app I found on the web (kmeans).

#### Latex app

The latex app gives a convenient way to experiment with latex for creating formulas, so there is a Forumula input box. Just type in a formula and click _Show!_ and it will attempt to compile it. For example, just enter in _\alpha ^ 2 and you will see the formula right next to it.

#### Kmeans app

The kmeans app was lifted from another website, just to see how hard it would be to convert over code found elsewhere and add it to the Study notebook. This app explores the Kmeans clustering of the standard Iris dataset in R.


### Notes

Originally, I just used the topic selection to determine keyword, and then I checked for files of different extensions (.tex, .R, etc). I realized that the markdown files could be rendered in Shiny, so I went with just those. The idea of other file formats still holds promise, however, for data sets and other optional information. In time, the app could be extended to handle more things.

Another possible extension would be to add multiple tabs, so that each topic can be in its own tab. That might be particularly handy for reference pages, such as Markdown and Latex cheat sheets
