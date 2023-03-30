# Individual Assignment 2
 

 # Part 1
 Forward rendering and deferred rendering are two different types of rendering 3D objects within a scene. 
 
 This type of rendering is the basic/normal form of rendering. Forward rendering is a type of 3D rendering that renders one object at a time where it starts at the cameras perspective and then gradually moves into the scene rendering object by object (one at a time). Therefore it is good when rendering small amounts of objects instead of large amounts in a large scene. 
 
![Forward Rendering](https://user-images.githubusercontent.com/122996304/228629727-146f455e-9dd0-4878-b4a2-d4ffe1e88bda.PNG)


 Deferred rendering is a different type of rendering where the rendering of the scene gets deferred a bit. The geometry is passed down the pipeline and then the lighting calculations are done. In this type of rendering, the lighting works differently therefore, shadows within the scene have no limits and the scene can hold as many lights as you want. 

![Deferred Rendering](https://user-images.githubusercontent.com/122996304/228630140-ce1b205d-94ac-4d4f-8469-c5c3d4c00a4a.png)


As you can see, these two types of rendering are different as they use the lighting differently. In the forward rendering method, the lighting is just calculated within the fragment shader but when you look at how the pipeline works in the deferred rendering, you will see that the lighting that would have been calculated within the fragment shader is taken out, and gets added in after the fragment shader as it gets added into the pipeline with the depth, normals and the colour. 


 # Part 2

 For re-creating the scene in unity, I began by creating a water shader (Editing the one from the lecture) so that the sin wave works a little differently. Instead of it being smooth or a sharp triangle wave, I made it so that it was more boxed out and squared by modifying the vert function. This sader was implemented by adding it to the bottom plane within the scene. This created the moving/box shaped water effect you will see when the game is running. To make this workable, in the vert function, there is a line that looks like this -> float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp + sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp;, and so I edited this line to use a normalize function that looks like this -> float waveHeight = normalize(sin(t + v.vertex.x * _Freq)) * _Amp + normalize(sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp);. By adding this mathimatical function to this line, it will create more of an up and down look in the waves. By doing this, it will create the box shaped waves look. This look of the waves is the best that I was able to accomplish, as I attempted multiple ways to make the waves bigger but they all resulted in this look. I believe that they still give off that box shaped wave look, but I wish I could have made it more noticable. I feel like above where I mentioned how I added the normalize function, it should have completed what I was hoping to achieve but it still did not therefore I feel like this would be the best that I will be able to accomplish. 



![flatWaves](https://user-images.githubusercontent.com/122996304/228300795-bc2dc217-50c2-4852-98e9-887bc524a43e.PNG)

 I added a poly poly paper boat to the scene in which I retreived from online at the unity asset store. Here is the link. https://assetstore.unity.com/packages/3d/lowpoly-paper-boat-61369
 
I then added the toon shading aspect to the water. I created blue ramp texture so that I could add it in. I applied this shader the same way I did with the water one above. Although it is the same, I edited that shader so that it has the toonish effect that you are looking for. To make this happen, I combined the important aspects of the toon shader into the water shader so it works.

![ToonOnWater](https://user-images.githubusercontent.com/122996304/228308960-0d974294-7cdb-4fad-a721-ece3dc2aa7d3.PNG)
![Untitled drawing (1)](https://user-images.githubusercontent.com/122996304/228309256-31f0d5cf-1e5a-4314-bffd-b2a8912e8742.png)

 # Part 3

1. a) Within this code below, it creates some variables and also it creates an array of RenderTextures

![a](https://user-images.githubusercontent.com/122996304/228696194-bfce2958-dd60-4aea-a906-f0860ae259f5.PNG)

   b) Within this code below, it edits and adjusts the photo, making its very own sort of temporary photo that has these things applied to it. 
    
![b](https://user-images.githubusercontent.com/122996304/228696258-39e24047-bb46-48f7-b663-1919c68eedb6.PNG)

   c) Within this code below, both of these do the same thing. It repeats a certain effect to a photo and then stores it in that "temporary photo". Then it makes currentDestination the new currentSource so that it can be repeated again and again. THe loop depends on the iterations variable. 
    
![c](https://user-images.githubusercontent.com/122996304/228696221-4f4d54f5-e08c-4fc2-8e11-47359b9b6c8f.PNG)

   d) Within this code below, it is where the Graphics.Blit is applied to the code as well.
    
![d](https://user-images.githubusercontent.com/122996304/228696212-348663a3-55e6-4e67-98b0-13f551d619c7.PNG)


2. What this code does is it make a photo/scene look a little blurrier. It takes a picture, makes it smaller, and copys over and over again. By doing this, after it continues to copy the picture and make it blurrier, the final product with my both blurry and smoother. 

3. This could be used in a shooting style game when after a player gets hit with a flashbang, then they are unable to hear and as well, their vision is deferred a bit making it blurry as the player should not be able to see greatly. 

# Part 4 

 I added the outlining shader to the boat. What I changed about this was instead of having a main colour for the material and then a colour for the outline itself, I made it so that there was a main texture on the material instead of the colour. Therefore you can set the material of the object and then set the colour of the outline. I added this shader to the boat within my scene so that it is able to stand out more for players. Therefore I made a wood PNG texture and then made the outline white. Here is a picture of what it looks like. 

![wood](https://user-images.githubusercontent.com/122996304/228679183-6b6cf4ed-b3cd-4bc0-88f1-64a5b37ecfdb.PNG)
![woodOutlining](https://user-images.githubusercontent.com/122996304/228679209-559b6b3b-e37d-4b25-9a16-7f8b268a1393.PNG)
![maintex](https://user-images.githubusercontent.com/122996304/228691855-3620720c-26ad-4a0d-a1c3-cb3517c8151e.PNG)


 I also added in the bloom effect that I add onto the camera. This effect changed how the scene is viewed and believe it really fit in with was i was going for throughout the scene. To make this shader different than the one that I made in the lecture, I added a "Blur" effect to it that you can change in the inspector. TO do this, I only had to create a property in the shader, define it and then within the half3 SampleBox function, times the blur effect property by it. Once I did that, I went into the c# script that I apply to the camera and declared it twice (once each in two different parts). Here are the pictures of the code that I edited. It either is zoomed in to the part that i added, or it is highlighted where I added it intot the code. THe first two pictures are of the c# script and the second two are in the shader. Then the last 2 are what it looks like with unity (in game and in the inspector).

![blur1](https://user-images.githubusercontent.com/122996304/228691679-a2273dbc-4efd-466a-88aa-35507441d3bd.PNG)
![blu2](https://user-images.githubusercontent.com/122996304/228691681-93260c63-43d9-4e5a-8842-be4fdc165f55.PNG)
![blur3](https://user-images.githubusercontent.com/122996304/228691682-64a42d51-a8bc-4e63-9e5d-31f7d9af9046.PNG)
![blur4](https://user-images.githubusercontent.com/122996304/228691683-6c3ab506-c7f0-44aa-9dbe-4e60fafd1bac.PNG)
![blur](https://user-images.githubusercontent.com/122996304/228692304-2ca27bb4-1c96-4e25-af27-8c3d9175dd9a.PNG)
![blur5](https://user-images.githubusercontent.com/122996304/228692307-dd4da1ff-478d-4691-9d19-3e557e48cf96.PNG)

# Part 5

1 & 2. First off this part of the code calls the LightingCSLambert which calculates the colour of the object using 3 inputs (SurfaceOutput, lightDir, and atten). Then the functions calculates the final colour of the object, and then it adds in the colour of the shadows by multipling it by 1.0 - atten. Finally, it returns a half4 which contains the final colour of the object. 

![p5a](https://user-images.githubusercontent.com/122996304/228698667-20974c34-1834-4654-a2e3-c847a0ff0cf0.PNG)


3. I feel like this coloured shadows shader would be great if it was applied to certain environements within games. Coloured shadows could both really help the scene look better appealing and even help navigate the player throughout the scene.

# Part 6

1. This shader works by applying shadows (not any shadows) to a plane of some sort. It takes a main texture that the plane has, and then any other texture that you would like to be the shadow. In this part of code below, it is made to transparent out any white that is within that shader texture, therefore if there are black lines (with a white background) in that texture, there will only be the black lines in the scene. I originally made this function an if statement, saying if the colour - black, then make it transparent, but after using lerp, this is what it looks like now. 
![shad1](https://user-images.githubusercontent.com/122996304/228700680-9ffe77d0-b8f5-4554-96ec-3a6bc8006ee3.PNG)


Therefore any shadows that will be emitted onto this plane will have a lined shadow effect onto it like what it looks like below in my scene. 
![shadowLines](https://user-images.githubusercontent.com/122996304/228700700-96c126e4-dd60-460f-9947-4594bf7a1705.PNG)

2. Flowchart Below
![flowchart shadow shader (1)](https://user-images.githubusercontent.com/122996304/228711009-e275be41-3c79-4abb-b1bf-1d71f3a4f5b7.png)

3. There are many places that this shader can be applied into a game. For example, if you are created a game that has a lot of toon shading and you would like to have shadows pertray this same concept, it is smart to use this effect to have your shadows look "toonish". This type of shadow shading can be used in many scenes to enhance the environement and make it more intriging and interesting for the player. Simple addtions to an environment like this goes a long way and most players do not even realize it as it can fit in with the scene so nicely. I would personally use this type of shadow shader in an environment that holds lots of shadows so that it is not completely dark and it would really enhance that scene.


# Part 7 (Self-Evaluation)

For this part, I will be giving myself a score from 1 out of 5 on each part and then justify the reasoning behind it 

Part 1 - 3/5
I worked hard on this part but after looking more at the difference between these two methods of rendering, I quickly realized that it is something I will be looking at more during my final exam review study time. I gave myself this mark because I feel like I have properly shown that I understand majority of this aspect but there is still room for learning and room to better my understand of these methods. 

Part 2 - 4/5
The reason I gave myself a 4 on part 2 is that I feel like I created good square like waves in the scene. I do wish that I could have made them more distinct but in the end, I think that i proved that I attempted to do this even if it still doesn't look like it in the scene. I have the proper understanding of how the sin function works and by using 1's and -1's, I tried using sign, normalize and more to achieve my goal. I created a toon shading to the waves and they actually look quite good as when the waves get deeper, the darker it will get (by making my own blue ramp texture).

Part 3 - 4/5
I really understood this shader as this is a motion blur like shader that will affect how the players vision works within the game. I never been the best at explaining shaders as a lot of the time, I do not understand the proper approach that I should take when explaning. I think I did a good job here of proving I knew what I was talking about, but I know that there is always room for improvment, especially for something like this where I know I can get better at in general. 

Part 4 - 5/5 
I am not normally one to give myself a 5/5 on something, even if it is one part in this project, but I believe that I completely showed my understanding here. Not only did I take two shaders that we learned and edited them so that they are different, but I also explained how they work and what I did to them in order to accomplish this. I provided loads of screenshots with highlights within them to fully show that I understand not only how they work but how to edit them to make something cool I haven't even made before. 

Part 5 - 3.5/5
I feel like I did a decently good job here but looking back, I think I could have maybe explained more. I just feel like this part did not have lots of potenial spots for explanation. Since the shader was quite straight forward and was easy to understand, I think I did a good job at explaining it and where it could used but when I compare the part 3, I did not explain a lot (I feel like the more I explain the more it shows you I understand it)

Part 6 - 4.5/5
I believe that I did a great job in this part, whether is be me explaining how this shader works, showing how effective it can be in a scene, creating a flowchart of the shader, and also explaining where this can be added in a game. I haven't really made too many flowcharts before so I am really hoping I did a great job at that but since I didn't entirely know if I did it correct, I just tried to explain the shader to the best of my ability. Since we made this in the tutorial, and it was my job to actually ensure that these shadow lines worked properly, I feel like I was able to grasp a better understanding due to it. 

Overall, I think I understand my strengths (editing shaders to add things to them, creating an ideal scene, having an organzied readMe with lots of explanations in them) and my weaknesses (Concepts like the deferred/forward rendering, fully explaining shaders code, and how to make charts) now. I believe that I properly understand what I need to study for and work on to ensure that I can maximize my mark for the final exam. :)



