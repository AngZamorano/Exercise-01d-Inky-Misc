VAR time = -1

VAR exit = 0

-> wake_up

== wake_up ==
You wake up in a dark hallway, before you could observe your surroundings more, you realized a monster is down the hall. 

+ [RUN] -> flashlight

== flashlight ==
As you ran away you noticed a light, and realized it is a flashlight.
+ [Quickly pick up flashlight] -> running

== running ==
Now that you see down the hallway, you noticed that you are stuck running in a maze.

+ [Go left] -> left_maze

+ [Go right] 
~ exit = exit + 1 
-> right_maze

== maze ==
+ {time < 6} [Go left] -> left_maze

+ {time < 6} [Go right] 
~ exit = exit + 1
-> right_maze

+ {time == 6} [The monster is right behind you] -> caught

+ {exit == 5} [You see a door that looks different from the other ones go through it?] -> Free

== left_maze ==
As you run down the maze you noticed { advance_time() } -> maze

== right_maze ==
As you run down the maze you noticed { advance_time() } -> maze

== Free ==
Made it out :)
-> END

== caught ==
As the monster grabs you, you start to panic, so much in fact in faint and go unconcious.
+ [wake up] -> wake_up

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 6:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "the wallpaper seems to be peeling away?"
        
        - time == 1:
            ~ return "the wallpaper is now completly gone"
        
        - time == 2:
            ~ return "the wood that was underneanth the wallpaper is now rotting"
        - time == 3:
            ~ return "the monster is getting way closer now"
        - time == 4:
            ~ return "the monster looks like a shadowy figure that is quickly catching up to you"
        - time == 5:
            ~ return "as the monster gets closer you can start to make out more details of its looks"
        - time == 6:
            ~ return "the monster just has a mouth where its stomach should be, and long figers that appear to be razor sharp"
    
    }
    
    ~ return time
    
    
    
