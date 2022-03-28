---
title: "Test Drive R Markdown"
author: "Eric O'Connor"
date: "3/28/2022"
output:
  html_document:
    keep_md: true
---


```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.3     v purrr   0.3.4
## v tibble  3.1.0     v dplyr   1.0.4
## v tidyr   1.1.2     v stringr 1.4.0
## v readr   1.4.0     v forcats 0.5.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
# map points by class using color
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, color=class))
```

![](testdrive_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

