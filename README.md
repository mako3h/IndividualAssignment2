# IndividualAssignment2
 

 # Part 1
 Forward rendering and deferred rendering are two different types of rendering 3D objects within a scene. 
 
 Forward rendering is a type of 3D rendering that renders one object at a time where it starts at the cameras perspective and then gradually moves into the scene rendering object by object (one at a time). Therefore it is good when rendering small amounts of objects instead of large amounts in a large scene. 
 
![Forward Rendering](https://user-images.githubusercontent.com/122996304/228629727-146f455e-9dd0-4878-b4a2-d4ffe1e88bda.PNG)


 Deferred rendering is a different type of rendering where the rendering of the scene gets deferred a bit. In this type of rendering, the lighting works differently therefore, shadows within the scene have no limits and the scene can hold as many lights as you want. 

![Deferred Rendering](https://user-images.githubusercontent.com/122996304/228630140-ce1b205d-94ac-4d4f-8469-c5c3d4c00a4a.png)

 # Part 2

 For re-creating the scene in unity, I began by creating a water shader (Editing the one from the lecture) so that the sin wave works a little differently. Instead of it being smooth or a sharp triangle wave, I made it so that it was more boxed out and squared by modifying the vert function. This sader was implemented by adding it to the bottom plane within the scene. This created the moving/box shaped water effect you will see when the game is running. To make this workable, in the vert function, there is a line that looks like this -> float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp + sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp;, and so I edited this line to use a normalize function that looks like this -> float waveHeight = normalize(sin(t + v.vertex.x * _Freq)) * _Amp + normalize(sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp);. By adding this mathimatical function to this line, it will create more of an up and down look in the waves. By doing this, it will create the box shaped waves look. This look of the waves is the best that I was able to accomplish, as I attempted multiple ways to make the waves bigger but they all resulted in this look. I believe that they still give off that box shaped wave look, but I wish I could have made it more noticable. I feel like above where I mentioned how I added the normalize function, it should have completed what I was hoping to achieve but it still did not therefore I feel like this would be the best that I will be able to accomplish. 



![flatWaves](https://user-images.githubusercontent.com/122996304/228300795-bc2dc217-50c2-4852-98e9-887bc524a43e.PNG)

 I added a poly poly paper boat to the scene in which I retreived from online at the unity asset store. Here is the link. https://assetstore.unity.com/packages/3d/lowpoly-paper-boat-61369
 
I then added the toon shading aspect to the water. I created blue ramp texture so that I could add it in. I applied this shader the same way I did with the water one above. Although it is the same, I edited that shader so that it has the toonish effect that you are looking for. To make this happen, I combined the important aspects of the toon shader into the water shader so it works.

![ToonOnWater](https://user-images.githubusercontent.com/122996304/228308960-0d974294-7cdb-4fad-a721-ece3dc2aa7d3.PNG)
![Untitled drawing (1)](https://user-images.githubusercontent.com/122996304/228309256-31f0d5cf-1e5a-4314-bffd-b2a8912e8742.png)

 # Part 3

2. What this code does is it make a photo/scene look a little blurrier. It takes a picture, makes it smaller, and copys over and over again. By doing this, after it continues to copy the picture and make it blurrier, the final product with my both blurry and smoother. 

# Part 4 

 I added the outlining shader to the boat. What I changed about this was instead of having a main colour for the material and then a colour for the outline itself, I made it so that there was a main texture on the material instead of the colour. Therefore you can set the material of the object and then set the colour of the outline. I added this shader to the boat within my scene so that it is able to stand out more for players. Therefore I made a wood PNG texture and then made the outline white. Here is a picture of what it looks like. 



 
