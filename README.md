# IndividualAssignment2
 

 # Part 1
 Forward rendering and deferred rendering are two different types of rendering 3D objects within a scene. 
 
 This type of rendering is the basic/normal form of rendering. Forward rendering is a type of 3D rendering that renders one object at a time where it starts at the cameras perspective and then gradually moves into the scene rendering object by object (one at a time). Therefore it is good when rendering small amounts of objects instead of large amounts in a large scene. 
 
![Forward Rendering](https://user-images.githubusercontent.com/122996304/228629727-146f455e-9dd0-4878-b4a2-d4ffe1e88bda.PNG)


 Deferred rendering is a different type of rendering where the rendering of the scene gets deferred a bit. The geometry is passed down the pipeline and then the lighting calculations are done. In this type of rendering, the lighting works differently therefore, shadows within the scene have no limits and the scene can hold as many lights as you want. 

![Deferred Rendering](https://user-images.githubusercontent.com/122996304/228630140-ce1b205d-94ac-4d4f-8469-c5c3d4c00a4a.png)

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


Therefore any shadows that will be emitted onto this plane will have a lined shadow effect onto it like what it looks like below in my scene. 