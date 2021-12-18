# AlgoSort
In this iOS application, we utilize various sorting algorithms to sort an array of integers (represented as a bar graph) in the order
that each algorithm would sort them in until they have been completely sorted. The underlying purpose of this project is to build
an app that uses the dispatch queue for multi-threading while following the best practices in memory management to ensure no cyclic
strong references.
## Features
1. This app implements several sorting algorithms to sort an array of integers.
2. Users are able to select the algorithms of their choice and the size of the array that will be sorted; this will be displayed on
the screen in the form of a bar graph adding/deleting bars to fit the given new array size. The data in the array to be sorted are
randomly generated (shuffled) each time.
3. Animated the progress of the sorting algorithms by displaying the state of the array being sorted in a fashion similar to what is in the sample UI. We also added small delays in the algorithms so that the progress is observable at a comfortable pace.
4. Used a dispatch queue to execute the sorting algorithm on a thread other than the main thread.
5. Created custom view class to display and animate the state of the array being sorted.
## Display
 
