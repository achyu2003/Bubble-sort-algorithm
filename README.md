# Bucket-sort-algorithm
Bucket sort is a sorting algorithm that separate the elements into multiple groups said to be buckets. Elements in bucket sort are first uniformly divided into groups called buckets, and then they are sorted by any other sorting algorithm. After that, elements are gathered in a sorted manner.

The basic procedure of performing the bucket sort is given as follows -

First, partition the range into a fixed number of buckets.

Then, toss every element into its appropriate bucket.

After that, sort each bucket individually by applying a sorting algorithm.

And at last, concatenate all the sorted buckets.

The advantages of bucket sort are -
1. Bucket sort reduces the no. of comparisons.
2. It is asymptotically fast because of the uniform distribution of elements.

The limitations of bucket sort are -
1. It may or may not be a stable sorting algorithm.
2. It is not useful if we have a large array because it increases the cost.

# Pre-requisites
You must have [RIPES Simulator](https://github.com/mortbopet/Ripes) installed. 

# Usage
Copt the code from ``bubblesort.s`` and paste in RIPES Simulator.
Go to memory output, `.data` to be able to see your required output

# Note
This is a project me and [Archanaa Chandaragi](https://github.com/Itryok) performed as part of our RISC-V Coursework at PES University.
