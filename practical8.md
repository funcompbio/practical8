---
layout: page
title: Practical 8
permalink: /practical8/
---

# Objectives

The learning objectives for this practical are:

 * Start and quit R and RStudio.
 * Get familiar with the RStudio interface.
 * Getting and setting the working directory in R.
 * Reading CSV files.
 * Subsetting rows of a data frame
 * Simple plotting

# Setup and background

To do this practical you need an installation of R and RStudio. You can find
the instructions in the [setup](/setup/) link on how to install R and RStudio
in your system. Once R and RStudio are installed, you should be able to start
RStudio by double-clicking on an icon like the one here below.

![](RStudioIcon.png)

We will download some COVID19 data to illustrate the use of R and RStudio.
Please follow the next two steps:

1. Go to the Catalan Health Departament COVID19 data portal at
   [https://dadescovid.cat](https://dadescovid.cat) and switch the language to
   "ENGLISH" using the pull-down menu on the top-right corner of the page.
2. Follow the downloads link and on the next page click and download the file
   corresponding to the "7 DAY AGGREGATION" for "CATALUNYA".
   Make sure you know exactly where in your filesystem this file
   has been downloaded. **Tip:** some browsers automatically download files
   into a folder called "Downloads" or under a name corresponding to the
   translation of "Downloads" to the default language of your operating system.
3. Make a directory in your filesystem, for instance at your _home_ directory,
   called `practical8` and copy in it the downloaded file.
4. Since the downloaded file is a ZIP file, uncompress as you did in
   [practical 1](/practical1/) so that you finally have a file called
   `catalunya_setmanal.csv` in the directory `practical8`.

If you are using the UPF _myapps_ cloud to run RStudio, then you need to
either use an internet browser in _myapps_ to download the data file directly
in the _myapps_ cloud or upload to the _myapps_ cloud the file that you have
downloaded in your own computer.

# Starting R and RStudio

RStudio is the most popular graphical user interface (GUI), or rather the
most popular
[integrated development environment (IDE)](https://en.wikipedia.org/wiki/Integrated_development_environment),
for working **with** R. However, RStudio **is not** R. RStudio **runs** R.
You can also run and work with R **without** RStudio. In fact, if you need to
work with R in a remote server to which you only have a text-based connection
through a terminal window, then you **cannot** use RStudio. If for whatever
reason, you cannot use RStudio, you can still follow this practical, skipping
the parts that specifically refer to the GUI of RStudio.

Once you have started RStudio, you should see its application window, which
should be similar to this one below.

![](RStudioFreshStart.png)

The RStudio window is initially divided in three main panes:

  * **R shell:** where you can interactively type R commands.
  * **Environment / history:** where you can browse through the
    objects that are being created and the commands that you have
    typed in the R shell.
  * **Files / plots / pkgs / help:** where you can navigate through
    the filesystem where RStudio is running and change the working
    directory, visualize plotting output, browse through the loaded
    packages and read help pages.

If you cannot start RStudio but you have installed R, you still can start
R by typing on the Unix shell command line:

```
$ R
```

Your terminal window should then be running R and looking similar to the
one below.

![](Rterminal.png)

# Quitting R and RStudio

To quit R and RStudio you should type the following instruction in the
R shell:

```
> q()
```
You should **not** type the `>` character, since it corresponds to the
R prompt and only indicates that the given instruction to the right of that character 
should be typed in the R shell. Normally, after that instruction R will
ask:

```
> q()
Save workspace image? [y/n/c]:
```
If you answer `y` then R will store all the objects you have created in a
hidden file called `.RData` and next time you start R, all those objects will
be automatically loaded. In such a case, R will show you the next message at
startup:

```
[Previously saved workspace restored]
```
In general, there is no reason to save the workspace when you quit R, so you
should always answer `n` to that question. The answer `c` _cancels_ the quitting
instruction. In RStudio you can also quit R and RStudio by either closing the
application window or through the `Quit` option in the _File_ or _RStudio_
top-level menu.

# R as a calculator

The R shell can be directly used as a calculator, type the following instructions
and figure out what the operators do:

```
> 1+1
> 5-4
> 3*2
> 6/2
> 4%%3
> 2**3
> 2^3
```

Now, type the following and press enter:

```
> 1+
```
You should have obtained the following output:

```
> 1+
+
```
where the cursor is next to the plus sign (`+`) that has appeared in the
line below. This plus sign indicates that the expression you have written
is incomplete. This often happens when there is, for instance, a missing
closing parenthesis. In this situation you can do two things: (1) you
complete the instruction or (2) you press the `Esc` key, which will cancel
the instruction. Try cancelling this incomplete sum with the `Esc` key.

Now try to calculate the natural logarithm of 10 by typing:

```
> log(10)
```
If you are using RStudio, note that when you have typed the name of the
function `log`, RStudio shows you a popup with contextual help, which
you can use to choose among functions that have `log` as a prefix in their
name.

# Getting and setting the working directory

Whenever we want to read or write data files to a specific working directory,
we need to make sure that the default directory access or R is pointing to that
directory. To find out the default working directory of R, you should call the
`getwd()` function in the R shell:

```
> getwd()
```

If the return path is not the working directory that we want, we can change it
with the function `setwd(dir)` where `dir` should be the path that we want to
set as working directory. In RStudio, using the _Files_ pane, we can navigate
through the file system to the directory we want to set as working directory
and then click on the `More` pull-down menu and select `Set As Working Directory`.

Using the function `setwd()`, or the RStudio _Files_ pane, change the working
directory to the path `practical8` that you should have created at the beginning
of this practical and where you have downloaded the file `catalunya_setmanal.csv`.

# Reading CSV files

We can read CSV files in R using the function `read.csv()`. Let's read the
CSV file `catalunya_setmanal.csv` as follows:

```
> dat <- read.csv("catalunya_setmanal.csv", sep=";", stringsAsFactors=TRUE)
```
Note that when writing the first letters of the filename, you can _autocomplete_
the rest of the filename by pressing the `TAB` key. Next to the filename as a
first argument, we also specified that the column delimiter in `comarques_setmanal.csv`
is a semicolon `;` and that we want R to treat character columns as a special
kind of object called _factor_.

The `read.csv()` function returns a `data.frame` object. You can verify it by
typing

```
> class(dat)
[1] "data.frame"
```

Figure out the dimensions of this `data.frame` object with the function `dim()`.

Examine the first and last rows of this `data.frame` object with the functions
`head()` and `tail()`. If you are running RStudio, go to the `Environment` pane
and click on the small right triangle icon next to the object name and then over
the object name.

A quick way to get a summary of the data stored in a `data.frame` object is
by calling the function `summary()` with that object as argument. Call `summary()`
on the previous `data.frame` object and you should be getting an output similar
to this one:

```
> summary(dat)
        NOM             CODI           DATA_INI         DATA_FI    RESIDENCIA
 CATALUNYA:756   CATALUNYA:756   2020-02-24:  3   2020-03-01:  3   --:252    
                                 2020-02-25:  3   2020-03-02:  3   No:252    
                                 2020-02-26:  3   2020-03-03:  3   Si:252    
                                 2020-02-27:  3   2020-03-04:  3             
                                 2020-02-28:  3   2020-03-05:  3             
                                 2020-02-29:  3   2020-03-06:  3             
                                 (Other)   :738   (Other)   :738             
 IEPG_CONFIRMAT    R0_CONFIRMAT_M        IA14         TAXA_CASOS_CONFIRMAT
 Min.   :  11.25   Min.   :0.6378   Min.   :    0.0   Min.   :   0.00     
 1st Qu.:  33.50   1st Qu.:0.9355   1st Qu.:    0.0   1st Qu.:   0.00     
 Median : 170.31   Median :1.0803   Median :   93.5   Median :  44.24     
 Mean   : 208.45   Mean   :1.2490   Mean   :  640.0   Mean   : 328.19     
 3rd Qu.: 221.46   3rd Qu.:1.3392   3rd Qu.:  474.3   3rd Qu.: 231.08     
 Max.   :1045.88   Max.   :5.0000   Max.   :10867.6   Max.   :6214.35     
 NA's   :517       NA's   :517                                            
 CASOS_CONFIRMAT  TAXA_PCR_TAR          PCR                TAR         
 Min.   :    0   Min.   :    0.0   Min.   :     0.0   Min.   :    0.0  
 1st Qu.:   82   1st Qu.:    0.0   1st Qu.:   812.8   1st Qu.:    0.0  
 Median :  234   Median :  526.8   Median :  4099.0   Median :    0.0  
 Mean   : 2421   Mean   : 3214.0   Mean   : 25724.0   Mean   :  825.3  
 3rd Qu.: 2035   3rd Qu.: 5447.2   3rd Qu.: 32643.0   3rd Qu.:    0.0  
 Max.   :32208   Max.   :27398.1   Max.   :228917.0   Max.   :61154.0  
                                                                       
 PERC_PCR_TAR_POSITIVES INGRESSOS_TOTAL   INGRESSOS_CRITIC     EXITUS       
 Min.   :  0.000        Min.   :   0.00   Min.   :  0.00   Min.   :   0.00  
 1st Qu.:  3.239        1st Qu.:   4.75   1st Qu.:  0.00   1st Qu.:   1.00  
 Median :  6.247        Median :  38.00   Median :  2.00   Median :  24.00  
 Mean   :  9.904        Mean   : 156.18   Mean   : 23.41   Mean   : 134.32  
 3rd Qu.:  9.176        3rd Qu.: 124.25   3rd Qu.: 19.00   3rd Qu.:  66.25  
 Max.   :100.000        Max.   :1866.00   Max.   :357.00   Max.   :1637.00  
```

# Subsetting rows of a data frame

Using the previously loaded `data.frame` object, build a vector of logical values
(a so-called _logical mask_) in one-to-one correspondence with the rows, where
a position in the vector is `TRUE` if the corresponding row contains data belonging
to the general population, i.e., excluding geriatric residences. Take into account
that the comparison operators in R are `==` for equality, `!=` for inequality,
`>` for larger than, `<` for smaller than, `>=` for larger or equal than and
`<=` for smaller or equal than`.

Using that logical mask, obtain a new `data.frame` object that includes only data
rows from the general population. Verify that the number of rows in the new object
matches the sum of `TRUE` values in the logical mask.

# Simple plotting

The main function to plot data points in (base) R is the function `plot()`. Type
the following call to the `plot()` function in the R shell:

```
plot(1:10)
```
It should produce the following plot.

![](simpleplot.png)

Try to understand what is this function call plotting. Now, type this other call:

```
plot(1:10, 2^(1:10))
```
Think about the difference between the two plots. Repeat again the last call
with the argument `type="l"`. What did this argument change?

Using the `data.frame` object with COVID19 data from the general population obtained
in the previous section and the `plot()` function, try to reproduce the **shape** of
the plots shown at the front page of the Catalan COVID19 data portal at
[https://dadescovid.cat](https://dadescovid.cat). It is not necessary to reproduce
details such as colors, axis labels and legends, a single solid line showing the
shape of the plotted values is enough.
