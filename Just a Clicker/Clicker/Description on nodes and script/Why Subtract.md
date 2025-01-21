### Why Subtract?

1. **Vector Math**: In 2D space, a vector between two points is found by subtracting the coordinates of one point from the other. This gives you the vector that points from the current position to the target position.
    
    - `mouse_pos - global_position` computes the vector pointing from the sprite's current position to the mouse's position.
2. **Movement Direction**: To move the sprite toward the mouse, we need to know the direction of the mouse relative to the sprite. The difference between the two positions (mouse and sprite) gives us the direction.
    
    For example:
    
    - If the mouse is at (100, 100) and the sprite is at (50, 50), subtracting the sprite’s position from the mouse’s position gives us a vector `(50, 50)`. This tells us that the sprite needs to move **50 units right** and **50 units up** to reach the mouse.

### Why Normalize?

3. **Normalized Vector**: When you normalize a vector, you convert it to a unit vector (a vector of length 1) that retains the direction but not the magnitude. This is important because we want the sprite to move in the correct direction, but we’ll control the speed separately using the `speed` variable.
    
    Without normalizing, if the sprite is far from the mouse, the raw difference between `mouse_pos` and `global_position` would be large, making the sprite move too fast. By normalizing, we ensure consistent movement speed, regardless of distance.
    

### Visual Example

Let’s say:

- `mouse_pos = (400, 300)`
- `global_position = (100, 200)`

Then:

gdscript

Copy code

`direction = mouse_pos - global_position            = (400, 300) - (100, 200)            = (300, 100)`

The resulting vector `(300, 100)` points toward the mouse. After normalizing, it will point in the same direction, but its magnitude will be 1.

So, when you multiply it by `speed`, the sprite moves toward the mouse at a consistent speed, no matter how far or close the mouse is.

### Summary

- Subtraction gives the **direction** from the sprite to the mouse.
- Normalization ensures the movement is **consistent** in speed, regardless of distance.

This is how you smoothly move the sprite toward the mouse without it speeding up or slowing down as it gets closer or farther.