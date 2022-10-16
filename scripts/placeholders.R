library(tidyverse)
library(plotly)

tabla <- mtcars

g_1 <-ggplotly(
    ggplot(tabla, aes(mpg, cyl))+
        geom_line())

g_2 <-ggplotly(
    ggplot(tabla, aes(mpg, disp))+
        geom_line())

g_3 <-ggplotly(
    ggplot(tabla, aes(mpg, hp))+
        geom_line())

g_4 <-ggplotly(
    ggplot(tabla, aes(mpg, drat))+
        geom_line())

g_5 <-ggplotly(
    ggplot(tabla, aes(mpg, wt))+
        geom_line())

g_6 <-ggplotly(
    ggplot(tabla, aes(mpg, qsec))+
        geom_line())

g_7 <-ggplotly(
    ggplot(tabla, aes(mpg, vs))+
        geom_line())

