## Instructions

The R-code files all have the same stucture. There's a main function `loadnplot(directory, device)` which calls two functions:
<ol>
<li>`load_data(directory)`</li>
<li>`plot_data(data, device)`</li>
</ol>
On completion `loadnplot()` returns the loaded data in a dataframe.  By preserving the returned dataframe, only `plot_data()` 
needs to be called for subsequent (re-)plots.

When `loadnplot()` is called without device specification it plots to the
screen. To plot to a "png"-file, use the parameter `dev="png"`, so the 
complete call looks like: `loadnplot(directory, dev="png")` 



## Output

The PNG-files backgrounds are **transparent**, *similar* to the *four example plots*.
They have a width of 480 pixels and a height of 480 pixels as per instructions.
