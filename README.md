![plotter](https://github.com/user-attachments/assets/6b6370fd-d88e-4635-bd8e-5c667a9a827f)

# Function-plotter
Mathematical function plotter written in MMBasic for PicoCalc:       
-support for up to 3 functions     
-correct the scaling of the grid and function graph        
-added panning           
-added numbering on the grid        
-added a point which display the x and y coordinates of the function        
-corrected errors like dividing by zero, etc.             
-display the function text on the screen               

Keyboard commands:          
-Panning with UP, DOWN, LEFT, RIGHT arrows         
-Return to the Function and Scaling input with BACK        
-Move the cursor with A, W, X, D         
-Zooming with + and -            
-Exit the app with ESC            

Some things to consider is the syntax when inputting the function. -X² will be seen by MMBasic as (-x)². It should be written as -(X²) instead. As well, there is no possibility for moving the cursor when writting the function so any correction should be done with BACK. Other issues might be discovered later, still improving.
