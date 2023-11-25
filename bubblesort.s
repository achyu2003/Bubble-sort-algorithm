.data
array: .word 3,1,8,7,64,7,10,9
n: .word 8

.text

start: 
    la x6,array  #x6 contai ns the array
    lw x7,n  # x7 = 8
    #but we need to start from only 7 iterations since we need only 7 comparisions
    addi x7,x7,-1 #x7=7
    li x8,4   # a common multiplier to traverse through array, so we are just keeping it for now
    mul x9,x7,x8 # we will start checking the array from the end, so we need to shift by 4*7 =28 positions to reach the end of the array
    add x10, x6,x9 # we are traversing to the end by adding 28 to x6(address pointing to start of array)
    #initialising loop variable with value 7
    addi x14,x7,0 #x14 => loop variable =7
    addi x19,x0,7 # another loop vriable for "next" initial loop value =7
    lw x11,0(x10) #loading the last element of the array into x11
    li x23,0  #initialising a check vairable
#calculate smallest element:
# step 1: The "smallest" loop runs
# when the "smallest" loop runs for the first time, it will start at the end of the array
# and traverse through all elements till the beginning of the array and finds the smallest element
# among all 8 elements ( 7 comparisions) hence x14=7
# step 2: the "small_assign" loop will keep a track of the smallest element in that iteration
#once the smallest elemnt is identified, we can swap its location with the proper place
# where it has to go



smallest:  # loop to find the smallest element in a certain array iteration
    
    beq x14,x0,check  #loop variable
    addi x10,x10,-4 # to traverse through array backwards
    # we had loaded x11 with the last value in the array, now we consider
    #that to be the smallest and then traverse backwards by comparing it with each element
    lw x12,0(x10)
    addi x14,x14,-1
    blt x12,x11,small_assign # if we find an element smaller than x11 then put its value into x11
    beq x0,x1,smallest  
    

small_assign: #assigns x11 with smallest value
#note: this loop will be traversed only if the smallest elemnt is not at the end
# to account for the case when the smallest element is at the end , we will use a check function
    addi x11,x12,0  # put in the new small number value( it will be in x12, we are putting in x11)   
    sub x20,x7,x19 # x20 will give the array position where we are supposed to put the smallest value
    add x16,x14,x20 # x16 value will give the array position that we are supposed to echange with
    addi x23,x23,1 #x23 is the checking variable
    beq x0,x1,smallest
   
    
check:
    bne x23,x0,next 
do:
    sub x20,x7,x19 # enter this loop if small_assign hasnt been entered
    add x16,x19,x20
    
next:   
    
    addi x19,x19,-1 # x19 was initialised to 7 inittially
    la x15,array
    
    mul x17,x16,x8 # to get array location of where we are supposed to exchange with
    # x17 = x16*4
    add x15,x15,x17 # x15 is array variable now we are traversing to the place
    lw x18,0(x15) # we are temporarily storing the value that we are gonna swap
    
 
    mul x21,x20,x8    # similarly x21 will have the address of the correct position
    la x20,array
    add x20,x20,x21
    lw x22,0(x20) # temporatily storing that value
    
    #swapping them both
    sw x22,0(x15) 
    sw x18,0(x20) 
    
 
#step2: Next time, x14 value decreases to 6, so the loop starts from the end and goes 
# till the 2nd element of the array ie,"smallest" function runs till last but 6th elemnt since
# 1st element is already in correct place
    
    
    add x14,x0,x19 
    


# and the 5,4,3,2,1 => this would check these many elemnts from the end of the array
    
    la x10,array
   
    mul x9,x7,x8 
    add x10, x6,x9 # once again traversing to end of the array
    lw x11,0(x10)  # storing that value in x11
    addi x23,x0,0 # resetting this check vairable
    bne x19,x0,smallest # going back to smallest
    
    
    
    
