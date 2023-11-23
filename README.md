# InstagramTransition

A custom shared-element **UIViewController** transition implemented in Swift.

## Description

This repository contains the complete implementation of **Instagram's image detail transition**, as detailed in a two-part article: [Part I](https://medium.com/supercharges-mobile-product-guide/replicating-instagrams-shared-transition-on-ios-uikit-part-i-144a26c31353) and [Part II](https://medium.com/supercharges-mobile-product-guide/replicating-instagrams-shared-transition-on-ios-uikit-part-ii-903a15c600e8). It features a custom push and and an **interactive, gesture-driven** pop transition that appears as follows:

<p align="center">
<img src="https://github.com/Kolos65/InstagramTransition/blob/main/transition.gif?raw=true" alt="Instagram's Transition Animation" />
<img width=50/>
<img src="https://github.com/Kolos65/InstagramTransition/blob/main/transition-slow.gif?raw=true" alt="Instagram's Transition Animation (Slowed)" />
</p>



## Test mode

To experiment with the calculated transformations while reading through the article, set the **test property** of the app delegate to **true**. This will display a test screen where you can interactively explore the applied transformations.
