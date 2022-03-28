library(tidyverse)
#### first steps
head(mpg)
# map points by class using color
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, color=class))
# map points by class using size
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, size=class))
# map points by class using alpha or shape
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, alpha=class))
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, shape=class))
# manually set all points in plot blue
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy), color="blue")
# map a continous variable to color, size, and shape
ggplot(data = mpg) + geom_point(mapping = aes(x= cyl, y=hwy, color=displ))
ggplot(data = mpg) + geom_point(mapping = aes(x= cyl, y=hwy, size=displ))
ggplot(data = mpg) + geom_point(mapping = aes(x= cyl, y=hwy, shape=displ))
# map same variable to multiple aesthetics
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, size=displ))
# what does the stroke aesthetic do?
?geom_point
# you can use the stroke aesthetic to modify the width of the border
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, color = "black", fill = "white", size = 5, stroke = 5)
# map an aesthetic to something other than a variable? (displ < 5)
ggplot(data = mpg) + geom_point(mapping = aes(x= cyl, y=hwy, color= displ > 5))
#### facets
# facets aka subplots by a single variable
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy)) +
  facet_wrap(~ class, nrow = 3)
# facets by multiple variables
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy)) +
  facet_grid(drv ~ cyl)
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy)) +
  facet_grid(. ~ cyl)
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy)) +
  facet_grid(drv ~ .)
# facet on a continuous variable
ggplot(data = mpg) + geom_point(mapping = aes(x= cyl, y=hwy)) +
  facet_wrap(~ displ, nrow = 3)
?facet_wrap
?facet_grid
#### geometric objects
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy))
# vs below for a smoothed line of those points
ggplot(data = mpg) + geom_smooth(mapping = aes(x= displ, y=hwy))
# you can change line types by variable, too
ggplot(data = mpg) + geom_smooth(mapping = aes(x= displ, y=hwy, linetype=drv))
ggplot(data = mpg) + geom_smooth(mapping = aes(x= displ, y=hwy, color=drv), show.legend=F)
# display mutliple geoms
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy)) +
  geom_smooth(mapping = aes(x= displ, y=hwy))
# use global mappings to avoid duplicative code
ggplot(data = mpg, mapping=aes(x=displ, y=hwy)) + geom_point(mapping=aes(color=class)) +
  geom_smooth()
# different data for different layers
ggplot(data = mpg, mapping=aes(x=displ, y=hwy)) + geom_point(mapping=aes(color=class)) +
  geom_smooth(data=filter(mpg, class=="subcompact"),
              se=F
              )
#### statistical transformations
head(diamonds)
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut))
# can also use stat_count in lieu of geom_bar
ggplot(data = diamonds) + stat_count(mapping = aes(x=cut))
# plot proportions
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, y= ..prop.., group=1))
?stat_summary
ggplot(data = diamonds) + stat_summary(mapping = aes(x=cut, y= depth),
                                       fun.ymin = min,
                                       fun.ymax = max,
                                       fun.y = median)
#### position adjustments
# can color bars with either color aes or fill aes
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, color=cut))
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, fill=cut))
# if you use another variable, bars will be stacked
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, fill=clarity))
# identity overlaps bars instead (must use alpha)
ggplot(data = diamonds, mapping = aes(x=cut, fill=clarity)) + 
         geom_bar(alpha = 1/10, position = 'identity')
# fill makes all stacked bars the same height
ggplot(data = diamonds) +geom_bar(mapping = aes(x=cut, fill=clarity), position='fill')
# dodge places overlapping objects directly beside one another
ggplot(data = diamonds) +geom_bar(mapping = aes(x=cut, fill=clarity), position='dodge')
# jitter works with scatterplots in case points overlap
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy), position='jitter')
?geom_jitter
#### coordinate systems
# coord_flip() switches the x- and y-axes
ggplot(data = mpg, mapping = aes(x= class, y=hwy)) + geom_boxplot()
ggplot(data = mpg, mapping = aes(x= class, y=hwy)) + geom_boxplot() + coord_flip()
